main <- function() {
  # Finds all files in the current directory that contain a given pattern.
  #
  # Takes one argument: the pattern to be searched.
  #
  # Ex. usage:
  #   Rscript find-pattern.R csv
  #
  args <- commandArgs(trailingOnly = TRUE)
  cat(list.files(pattern = args[1]), sep = "\n")
}

main() #Need a call to function in order to output anything
