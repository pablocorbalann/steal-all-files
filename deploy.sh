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

git add .
git commit -m "$1:$2"
git push
