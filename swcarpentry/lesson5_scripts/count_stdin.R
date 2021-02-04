#Reads lines from standard input
#i.e you will need to use the '<' character to redirect the contents of a file to standard input
lines <- readLines(con = file("stdin"))
count <- length(lines)
cat("lines in standard input: ")
cat(count, sep = "\n")
