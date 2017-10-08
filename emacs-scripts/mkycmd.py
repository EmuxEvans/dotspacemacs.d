#!/usr/bin/env python


import os
from shutil import copyfile
import fileinput

def main(path, project_dir = os.getcwd()):
    include_dirs = [project_dir]
    yconf_template_path = os.path.join(path, "mkycmd-template-ycm_extra_conf.py")
    dirlocals_template_path = os.path.join(path, "mkycmd-template-dirlocals.el")


    print "project_dir:%s" % (project_dir)
    print "my path:%s" % (path)
    print "yconf_path:%s" % (yconf_template_path)
    print "dirlocals_path:%s" % (dirlocals_template_path)

    yconf_path = os.path.join(project_dir, ".ycm_extra_conf.py")
    dirlocals_path = os.path.join(project_dir, ".dir-locals.el")
    projectile_path = os.path.join(project_dir, ".projectile")

    copyfile(yconf_template_path, yconf_path)
    copyfile(dirlocals_template_path, dirlocals_path)
    f = open(projectile_path, "w+")
    f.close

    yconf = open(yconf_path, "r")
    dirlocals = open(dirlocals_path, "r")
    yconf_string = ""
    dirlocals_string = ""

    for root, dirs, files in os.walk(project_dir):
        for file in files:
            if file.endswith(".h") and root not in include_dirs:
                include_dirs.append(root)

    for include_dir in include_dirs:
        yconf_string += ", '-I', '%s'\n" % (include_dir)
        dirlocals_string += "(semantic-add-system-include \"%s\" 'c++-mode)\n" % include_dir
        print "yconf_string:%s" % (yconf_string)
        print "dirlocals_string:%s" % (dirlocals_string)

    for line in fileinput.input(yconf_path, inplace = True):
        print(line.replace("$template$", yconf_string))

    for line in fileinput.input(dirlocals_path, inplace = True):
        print(line.replace("$template$", dirlocals_string))


if __name__ == "__main__":
    print "main"

#Check weather __file__ is defined
#In emacs ptyon, __file__ will not defined
try:
  __file__
except NameError:
  main('/Users/emuxevans/sync/bs/conf/emacs/offical-spacemacs/spacemacs-private/emacs-scripts')
else:
  root_path = os.path.realpath(__file__)
  root_path = os.path.dirname(root_path)
  main(root_path)
