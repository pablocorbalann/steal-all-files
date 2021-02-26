#!/bin/bash
# This script has been created for making the executable of the application.
#
# You can read the License for this script in the "LICENSE" file of this folder.
#
# For more information, visit: github.com/pblcc/steal-all-files (if you have access to it)
. .scripts/funcs.sh

if ! program_exists "pyinstaller"; then
  read -p "Pyinstaller is not installed, do you want to install it? [y/N]: " installpyinstaller
  if [ "$installpyinstaller" == "y" ]; then
    pip3 install pyinstaller
    pip install pyinstaller
  fi
fi

# Now that we have installed pyinstaller, we can generate the executable
pip3 install -r requirements.txt
pip install -r requirements.txt

pyinstaller --onefile --noconsole script.py
