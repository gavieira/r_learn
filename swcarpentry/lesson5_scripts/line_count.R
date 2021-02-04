#Reads lines from standard input or arguments
main <- function() {
  args <- commandArgs(trailingOnly = T)
  
  if (length(args) == 0) {
    count <- count_lines(file("stdin"))
    cat("lines in standard input: ")
    cat(count, sep = "\n")
  } else {
    maxlines = 0
    for (num in 1:length(args)) {
      filename = args[num]
      count = count_lines(filename)
      cat("lines in file", filename, ":")
      cat(count, sep = "\n")
      maxlines = maxlines + count
    }
    cat("total number of lines:", maxlines, "\n")
  }
}

count_lines <- function(file){
  lines <- readLines(con = file)
  return (length(lines))
}

main()
