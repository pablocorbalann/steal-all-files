#!/bin/bash
# This small bash script has been created for deploying the application to GitHub, for
# running this script you can use: sh deploy.sh
#
# This script has been created by Pablo Corbalán De Concepión | tw: @pablocorbcon
#
# You can read the License for this script in the "LICENSE" file of this folder.
#
# For more information, visit: github.com/pblcc/steal-all-files (if you have access to it)

program_exists() {
  command -v "$1" &> /dev/null
}

if ! program_exists "git"; then
  echo "Git is not installed in this computer, please install git..."
fi

git pull

# Run the tests for the application
python3 test_script.py

# asks the user if test have passed to then push
read -p "Do you want to update the code in the GitHub repository? [y/N]: " confirm

if [ "$confirm" == "y" ]; then
  git add .
  git commit -m "$1: $2"
  git push
fi

echo "Deploy script ended..."
