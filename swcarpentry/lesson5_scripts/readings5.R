#Checa o valor maximo, minimo ou media para cada coluna de um arquivo csv
#Mas separa o codigo em funçoes diferentes, para ficar mais legivel
#E tbm especifica as possiveis flags. Se der alguma flag diferente das especificadas, da um erro
main <- function() {
  args <- commandArgs(trailingOnly = TRUE)
  action <- args[1]
  filenames <- args[-1]
  stopifnot(action %in% c("--min", "--mean", "--max"))

  for (f in filenames) {
    process(f, action)
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
