  #Setting workdir
  setwd("/home/gabriel/Dropbox/repos/r_learn/swcarpentry")
  
  #Reading tabular data into variable
  dat <- read.csv('./data/inflammation-01.csv', header = FALSE)
  
  #Getting help for a specific function (eg. read.csv)
  ?read.csv
  help("read.csv")
  
  #Getting type of variable (eg. dat)
  class(dat)
  
  #Getting dimension of dataframe - nrows and ncolumns
  dim(dat)
  
  #Getting first or last columns from dataframe
  head(dat)
  tail(dat)
  
  #Dataframe slicing (also applicable to strings and vector)
  #First value is row, second is column
  dat[1,1] #Row 1, Column 1
  dat[30, 20] # middle value in dat, row 30, column 20
  dat[c(1, 3, 5), c(10, 20)] # Rows 1,3 and 5, columns 10 and 20
  dat[5,] # All values for row 5
  dat[,4:10] # Entire columns 4 through 10
  dat[,c("V10", "V25")] # Address column by name  
  
  #apply() function
  apply(dat, 1, mean) #Applies mean function to each row (1)
  apply(dat, 2, mean) #Applies mean function to each row (2)
  #Alternatively:
  rowMeans(dat)
  colMeans(dat)
  
  #Using the inflammation data frame dat from above: Let’s pretend there was something wrong with the instrument on the first five days for every second patient (#2, 4, 6, etc.), which resulted in the measurements being twice as large as they should be.
    
  # 1 - Write a vector containing each affected patient (hint: ?seq)
  # 2 - Create a new data frame in which you halve the first five days’ values in only those patients
  # 3 - Print out the corrected data frame to check that your code has fixed the problem
    
  whichPatients <- seq(2, 60, 2) # i.e., which rows
  whichDays <- seq(1, 5)         # i.e., which columns
  dat2 <- dat
  # check the size of your subset: returns `30 5`, that is 30 [rows=patients] by 5 [columns=days]
  dim(dat2[whichPatients, whichDays])
  dat2[whichPatients, whichDays] <- dat2[whichPatients, whichDays] / 2
  dat2
  
  #Getting metrics from inflammation data by day(collumn)
  avg_day_inflammation <- apply(dat, 2, mean)
  max_day_inflammation <- apply(dat,2,max)
  min_day_inflammation <- apply(dat,2,min)
  sd_day_inflammation <- apply(dat,2,sd)
  median_day_inflammation <- apply(dat,2,median)
  summary_day_inflammation <- apply(dat,2,summary)
  
  #Plotting simple x-y graph
  plot(avg_day_inflammation)