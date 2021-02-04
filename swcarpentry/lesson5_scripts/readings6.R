#If this script does not receive any filenames as parameters, will try to read standard input
main <- function() {
  args <- commandArgs(trailingOnly = TRUE)
  action <- args[1] #The first parameter is the flag
  filenames <- args[-1] #All parameters except the first
  stopifnot(action %in% c("--min", "--mean", "--max"))

  if (length(filenames) == 0) { #If no args...
    process(file("stdin"), action) ##Read stdin
  } else {
    for (f in filenames) {
      process(f, action)
    }
  }
}

process <- function(filename, action) {
  dat <- read.csv(file = filename, header = FALSE)

  if (action == "--min") {
    values <- apply(dat, 1, min)
  } else if (action == "--mean") {
    values <- apply(dat, 1, mean)
  } else if (action == "--max") {
    values <- apply(dat, 1, max)
  }
  cat(values, sep = "\n")
}

main()
