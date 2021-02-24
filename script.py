#!/usr/bin/env python
PATH = "~"
OUTPUT = "example.zip"
MODE = "w"
# This is the main script of the steal-all-files github repository.
#
# This script has been created by Pablo Corbalán De Concepión | tw: @pablocorbcon
#
# You can read the License for this script in the "LICENSE" file of this folder.
#
# For more information, visit: github.com/pblcc/steal-all-files (if you have access to it)
from rich import print
from rich.markdown import Markdown
from rich.console import Console

import sys
import os
import zipfile

console = Console()

def exitapp(**kwargs):
    """
    This function is used to exit the app using the sys.exit function

    Parameters
    ----------
    kwargs: **
        Some keywords for closing the app
        {
            code: int
                The exit code
            msg: str
                The message if there is a message
        }
    """
    # check if the user has actually used keywords
    keys = kwargs.keys()
    if "msg" in keys:
        print(f"> {kwargs['msg']}")
    code = 0 if "code" not in keys else kwargs["code"]
    sys.exit(0)



def readfile(file_route):
    """
    Reads a file, handles it's exceptions and then returns the content of
    that file.

    Parameters
    ----------
    file_route: str
        The file route for reading all 

    Returns
    -------
    The content of file_route
    """
    try:
        with open(file_route) as f:
            return f.read()
    except FileNotFoundError as e:
        print("We can't find a file! :500:")
        exitapp(-1, e)
    except Exception as e:
        exitapp(-1, e)



def displayhelp():
    """
    This function is used for displaying help and the commands about the application

    For running this function use: -h --help
    """
    f = readfile("README.md")
    console.print(Markdown(f))



def displaylicense():
    f = readfile("LICENSE.md")
    console.print(Markdown(f))



def zipdir(path, ziph):
    # ziph is zipfile handle
    for root, dirs, files in os.walk(path):
        for file in files:
            ziph.write(os.path.join(root, file), os.path.relpath(os.path.join(root, file), os.path.join(path, '..')))

def isarg(arg, value=False):
    """
    Returns True if the argument :arg: is an actual argument

    Parameters
    ----------
    arg: str
        The argument to be checked
    value: bool
        True if :arg: should have a value
    """
    is_arg = False
    arg_value = None
    args = sys.argv
    if not value:
        if arg in args:
            is_arg = True
    else:
        # We also have to check if the argument has a value to then return it
        for i, argument in enumerate(args):
            if argument == arg:
                if i + 1 < len(args):
                    arg_value = args[i + 1]
                    is_arg = True
    # Return a tupple with all this information
    return (is_arg, arg_value)



def readargs():
    """
    This function reads the arguments of the application using the system library to 
    display them and set up the global configuration variables using :func isarg:
    """
    if isarg("-h")[0] or isarg("--help")[0]:
        # The user simply wants to display some help and information about the program
        displayhelp()
        exitapp()
    if isarg("-l")[0] or isarg("--license")[0]:
        displaylicense()
        exitapp()

def main():
    readargs()

main()
