#The answer in the softwarecarpentry class is different (and simpler)

check_f <- function(vect) {
	#Checks if vector has any False values
	return (any(vect == F))
}



main <- function() {
	#Checks if all dataframes provided as arguments have the same size
  args <- commandArgs(trailingOnly = TRUE)
  if (length(args) == 1) {
	  data <- read.csv(file = args, header = F)
	  dims <- dim(data)
	  cat("Only one dataframe provided \n")
	  cat("Its size is:", dims[1], "rows and", dims[2], "columns")
	} else {
		for (num in 1:(length(args) -1)) {
			df1 <- read.csv(file = args[num], header = F)
			df2 <- read.csv(file = args[num+1], header = F)
			compare <- dim(df1) == dim(df2)
			if (check_f(compare)) {
				return (cat("Not all dataframes have the same number of rows and columns"))
			}
	}
		return (cat("All dataframes have the same number of rows and columns"))
  }
}

main() #Need a call to function in order to output anything
