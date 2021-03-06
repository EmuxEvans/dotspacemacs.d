;;; kanban.el --- Parse org-todo headlines to use org-tables as Kanban tables
;;
;; Copyright (C) 2012-2015  Arne Babenhauserheide <arne_bab@web.de>

;; Version: 0.1.6

;; Author: Arne Babenhauserheide <arne_bab@web.de>
;; Keywords: outlines, convenience

;; This file is NOT part of Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of
;; the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public
;; License along with this program; if not, write to the Free
;; Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
;; MA 02111-1307 USA
;;
;;; Commentary:

;; If you have not installed this from a package such as those on
;; Marmalade or MELPA, then save kanban.el to a directory in your
;; load-path and add
;;
;; (require 'kanban)
;;
;; to your Emacs start-up files.
;;
;; Usage:
;;
;; * Zero state Kanban: Directly displaying org-mode todo states as kanban board
;;
;; Use the functions kanban-headers and kanban-zero in TBLFM lines to
;; get your org-mode todo states as kanban table. Update with C-c C-c
;; on the TBLFM line.
;;
;; Example:
;;
;; |   |   |   |
;; |---+---+---|
;; |   |   |   |
;; |   |   |   |
;; #+TBLFM: @1='(kanban-headers $#)::@2$1..@>$>='(kanban-zero @# $# "TAG" '(list-of-files))
;; "TAG" and the list of files are optional
;;
;; * Stateful Kanban: Use org-mode to retrieve tasks, but track their state in the Kanban board
;;
;; |   |   |   |
;; |---+---+---|
;; |   |   |   |
;; |   |   |   |
;; #+TBLFM: @1='(kanban-headers $#)::@2$1..@>$1='(kanban-todo @# @2$2..@>$> "TAG" '(list-of-files))
;; "TAG" and the list of files are optional
;;
;; TODO: The links don’t yet work for tagged entries. Fix that. There
;; has to be some org-mode function to retrieve the plain header.
;;
;; TODO: kanban-todo sometimes inserts no tasks at all if there are multiple tasks in non-standard states.
;;
;; TODO: bold text in headlines breaks the parser (*bold*).
;; 
;; ChangeLog:
;;
;;  - 0.1.6: defcustom instead of defvar
;;  - 0.1.5: Allow customizing the maximum column width with
;;           kanban-max-column-width
;;  - 0.1.4: Test version to see whether the marmalade upload works.
;; 
;;; Code:

;; Get the defined todo-states from the current org-mode document.
;;;###autoload
(defun kanban-headers (column)
  "Fill the headers of your table with your org-mode TODO
states. If the table is too narrow, the only the first n TODO
states will be shown, with n as the number of columns in your
table."
  (let ((words org-todo-keywords-1))
    (nth (- column 1) words)))

(defcustom kanban-max-column-width 30
  "The maximum width of the columns in the KANBAN table.")

(defun kanban--todo-links-function ()
  "Retrieve the current header as org-mode link."
  ;;;; (message "kanban--todo-links-function")
  (let ((file (buffer-file-name))
        (line (filter-buffer-substring
               (point) (line-end-position)))
        ; yes, I can use the row variable. It bleeds over from the
        ; calling function.
        (keyword (nth (- row 1) org-todo-keywords-1)))
    (if file
        (setq file (concat file "::")))
    ; clean up the string
    (let* (; first remove the initial headline marker FIXME: currently gets later "* ", too
           (cleanline (nth 1 (split-string line "* ")))
           ; and kill off links in the link part
           (link (replace-regexp-in-string "\\[" "%5B"
                                           (replace-regexp-in-string "\\]" "%5D" cleanline)))
           ; then kill off trailing space and tags in the name part
           (notrailing (replace-regexp-in-string "\\( +$\\| +:\\w.*: *$\\)" "" cleanline))
           ; and links
           (nolinks (replace-regexp-in-string
                     "\\[" "{" (replace-regexp-in-string
                                "\\]" "}" (replace-regexp-in-string
                                           "\\[\\[\\(.*\\)\\]\\[\\(.*\\)\\]\\]" "{\\2}" notrailing))))
           ; finally shorten the string to a maximum length of kanban-max-column-width chars
           (clean (substring nolinks
                             (+ (length keyword) 1)
                             (min kanban-max-column-width (length nolinks)))))
      ;;;;(message "link:%s" link)
      (concat "[[" file link "][" clean "]]" ))))

(defun kanban--todo-links-auto-insert-function ()
  "Retrieve the current header as org-mode link."
  (let ((file (buffer-file-name))
        (outline (org-element-property :raw-value (org-element-at-point)))
        (line (filter-buffer-substring
               (point) (line-end-position))))
    outline
    ))

;; Fill the kanban table with tasks with corresponding TODO states from org files
;;;###autoload
(defun kanban-zero (column row &optional match scope)
  "Zero-state Kanban board: This Kanban board just displays all
org-mode headers which have a TODO state in their respective TODO
state. Useful for getting a simple overview of your tasks.

Gets the COLUMN and ROW via TBLFM ($# and @#) and can get a string as MATCH to select only entries with a matching tag, as well as a list of org-mode files as the SCOPE to search for tasks."
  ;; (message "entries:%S" (length (org-map-entries
  ;;                                'kanban--todo-links-auto-insert-function
  ;;                                "+TODO=\"BACKLOG\"|+TODO=\"TODO\"|+TODO=\"STARTED\"|+TODO=\"QA\"|+TODO=\"BUG\"|+TODO=\"DONE\""
  ;;                                scope)))
  ;; (message "row:%S column:%S" row column)
  (let
      ((elem (nth (- column 2)
                  (delete nil (org-map-entries
                               'kanban--todo-links-function
                               ; select the TODO state via the matcher: just match the TODO.
                               (if match
                                   (concat match "+TODO=\"" (nth (- row 1) org-todo-keywords-1) "\"")
                                 (concat "+TODO=\"" (nth (- row 1) org-todo-keywords-1) "\""))
                               ; read all agenda files
                               (if scope
                                   scope
                                 'agenda))))))

    (progn (if (and (= column 2) (= row 1))
               (kanban-fillrows (- (length org-table-dlines) 2) (if scope scope 'agenda)))
               ;;(message "row 2 column 1 allrows:%S" (- (length org-table-dlines) 2)))
           (if (equal elem nil)
               ""
             elem))
    ))

(defun kanban-org-table-kill-row ()
  "Delete the current row or horizontal line from the table."
  (interactive)
  (if (not (org-at-table-p))
      (user-error "Not at a table"))
  (let ((col (current-column))
        (dline (org-table-current-dline)))
    (kill-region (point-at-bol) (min (1+ (point-at-eol)) (point-max)))
    (if (not (org-at-table-p)) (beginning-of-line 0))
    ))


(defun kanban-org-table-insert-row (&optional arg)
  "Insert a new row above the current line into the table.
With prefix ARG, insert below the current line."
  (interactive "P")
  (if (not (org-at-table-p))
      (user-error "Not at a table"))
  (let* ((line (buffer-substring (point-at-bol) (point-at-eol)))
         (new (org-table-clean-line line)))
    ;; Fix the first field if necessary
    (if (string-match "^[ \t]*| *[#$] *|" line)
        (setq new (replace-match (match-string 0 line) t t new)))
    (beginning-of-line (if arg 2 1))
    (let (org-table-may-need-update) (insert-before-markers new "\n"))
    (beginning-of-line 0)
    (re-search-forward "| ?" (point-at-eol) t)
    (and (or org-table-may-need-update org-table-overlay-coordinates)
         (org-table-align))
    ))
(defun kanban-fillrows (row scope)
  (let
      (
       (i 0)
       (backlogCount (length (org-map-entries
                           'kanban--todo-links-auto-insert-function
                           "+TODO=\"BACKLOG\""
                           scope)))
       (todoCount (length (org-map-entries
                           'kanban--todo-links-auto-insert-function
                           "+TODO=\"TODO\""
                           scope)))
       (startedCount (length (org-map-entries
                           'kanban--todo-links-auto-insert-function
                           "+TODO=\"STARTED\""
                           scope)))
       (qaCount (length (org-map-entries
                           'kanban--todo-links-auto-insert-function
                           "+TODO=\"QA\""
                           scope)))
       (bugCount (length (org-map-entries
                           'kanban--todo-links-auto-insert-function
                           "+TODO=\"BUG\""
                           scope)))
       (doneCount (length (org-map-entries
                          'kanban--todo-links-auto-insert-function
                          "+TODO=\"DONE\""
                          scope)))
       )

    (progn
      (let* ((i 0)
                 (maxCount (max backlogCount todoCount startedCount startedCount qaCount bugCount doneCount))
                 (deleteCount (- row maxCount))
                 )
            (while (< i deleteCount) (progn (setq i (+ i 1)) (kanban-org-table-kill-row))))
      (let* ((i 0)
                  (maxCount (max backlogCount todoCount startedCount startedCount qaCount bugCount doneCount))
                  (insertCount (- maxCount row))
                  )
             (while (< i insertCount) (progn (setq i (+ i 1)) (kanban-org-table-insert-row)))))
    ""
    ))


; Fill the first row with TODO items, except if they exist in other cels
;;;###autoload
(defun kanban-todo (column cels &optional match scope)
  "Kanban TODO item grabber. Fills the first row of the kanban
table with org-mode TODO entries, if they are not in another cell
of the table. This allows you to set the state manually and just
use org-mode to supply new TODO entries.

Gets the COLUMN and all other CELS via TBLFM ($# and @2$2..@>$>) and can get a string as MATCH to select only entries with a matching tag, as well as a list of org-mode files as the SCOPE to search for tasks."
 (let ((elem (nth (- column 2) (delete nil
                                   (org-map-entries
                                    (lambda
                                      ()
                                      (let
                                          ((file (buffer-file-name))
                                           (line (filter-buffer-substring (point) (line-end-position)))
                                           (keyword (nth 0 org-todo-keywords-1)))
                                        (if file
                                            (setq file (concat file "::")))
                                        (let* ((cleanline (nth 1 (split-string line "* ")))
                                               (shortline (substring cleanline
                                                                     (+ (length keyword) 1)
                                                                     (min 40 (length cleanline))))
                                               (clean (if (member " " (split-string
                                                                       (substring shortline
                                                                                  (min 25 (length shortline)))
                                                                       ""))
                                                          (mapconcat 'identity
                                                                     (reverse (rest (reverse
                                                                                     (split-string shortline " "))))
                                                                     " ") shortline)))
                                          (concat "[[" file cleanline "][" clean "]]" ))))
                                    (if match
                                        (concat match "+TODO=\"" (nth 0 org-todo-keywords-1) "\"")
                                      (concat "+TODO=\"" (nth 0 org-todo-keywords-1) "\""))
                                    (if scope
                                        scope
                                      'agenda))))))
   (if
       (or (member elem (list cels)) (equal elem nil))
       " " ; the element exists in another table or is nil: Keep the cel empty
     elem))) ; otherwise use the element.



;; An example for auto-updating kanban tables from duply.han
;; I use the double-dash to mark this as "private" function
(defun kanban--update-function (&optional kanbanbufferregexp)
  (when (not (stringp kanbanbufferregexp))
      (setq kanbanbufferregexp "k[a-z]+kk.org"))
  (when (and (stringp buffer-file-name)
             (string-match kanbanbufferregexp buffer-file-name)) ;; match files such as kXXkk.org, kYYkk.org etc.
    (save-excursion
      (beginning-of-buffer)
      (while (search-forward "='(kanban-" nil t)
        (org-ctrl-c-ctrl-c)))))

; The following lines activate the auto-updating.

; (run-at-time "3 min" 180 '(lambda () (kanban--update-function)))
;; refreshes kanban table every 3 min after emacs startup.
; (add-hook 'find-file-hook 'kanban--update-function)

(provide 'kanban)
;;; kanban.el ends here
