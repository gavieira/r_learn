#Checa o valor maximo, minimo ou media para cada coluna de um arquivo csv
#Mas separa o codigo em funçoes diferentes, para ficar mais legivel
#E tbm especifica as possiveis flags. Se der alguma flag diferente das especificadas, da um erro
main <- function() {
  args <- commandArgs(trailingOnly = TRUE)
  action <- args[1]
  filenames <- args[-1]
  stopifnot(action %in% c("-n", "-m", "-x"))

  for (f in filenames) {
    process(f, action)
  }
}

process <- function(filename, action) {
  dat <- read.csv(file = filename, header = FALSE)

  if (action == "-n") {
    values <- apply(dat, 1, min)
  } else if (action == "-m") {
    values <- apply(dat, 1, mean)
  } else if (action == "-x") {
    values <- apply(dat, 1, max)
  }
  cat(values, sep = "\n")
}

main()
