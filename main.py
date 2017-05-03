import os
import json
from shutil import copyfile

# counting on being one step out of home dir
THIS_DIR = os.getcwd()
HOME_DIR = "".join(THIS_DIR.split("/backup_config")[0])

def do_it():
    filenames, dirs = get_names()
    copy_files(filenames, dirs)

def get_names():
    with open("names.json", "r") as infile:
        names = json.load(infile)
        files = names.get("files")
        dirs = names.get("directories")
        return files, dirs

def copy_files(filenames, dirs):
    """not doing anything with dirs yet, don't care enough"""

    for name in filenames:
        srcfile = HOME_DIR + "/{}".format(name)
        destfile = THIS_DIR + "/{}".format(name)
        copyfile(srcfile, destfile)

    print("{} files copied".format(len(filenames)))

do_it()
