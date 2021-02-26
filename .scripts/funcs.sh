# This program contains all the functions that are used in more than one script.
#
# This script has been created by Pablo Corbalán De Concepión | tw: @pablocorbcon
#
# You can read the License for this script in the "LICENSE" file of this folder.
#
# For more information, visit: github.com/pblcc/steal-all-files (if you have access to it)

program_exists() {
  command -v "$1" &> /dev/null
}

