#!/bin/bash
# This small bash script has been created for deploying the application to GitHub, for
# running this script you can use !BASH!
#
# bash .scripts/deploy.sh
#
# This script has been created by Pablo Corbalán De Concepión | tw: @pablocorbcon
#
# You can read the License for this script in the "LICENSE" file of this folder.
#
# For more information, visit: github.com/pblcc/steal-all-files (if you have access to it)

. .scripts/funcs.sh

if ! program_exists "git"; then
  echo "Git is not installed in this computer, please install git..."
fi

git pull

# Run the tests for the application
echo "We are going to execute the tests of the script..."
python3 test_script.py

# Generate executables
echo "We are going to generate the executables for UNIX..."
sh .scripts/makeunix.sh
echo "We have generated all executables without problems, so we are going to remove dependencies..."
rm -rf dist/ build/

# asks the user if test have passed to then push
read -p "Do you want to update the code in the GitHub repository? [y/N]: " confirm

if [ "$confirm" == "y" ]; then
  git add .
  git commit -m "$1: $2"
  git push
fi

echo "Deploy script ended..."
