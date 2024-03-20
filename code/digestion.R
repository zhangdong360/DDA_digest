digestion <- function(dirname) {
  library(readr)
  library(dplyr)
  id_uni_pep <- read_delim(dirname, skip = 3,
                           delim = "\t", escape_double = FALSE,
                           trim_ws = TRUE) %>%
    select(`Peptides`)
  y <- id_uni_pep$`Peptides`
  raw_Peptides <- id_uni_pep$`Peptides`
  symbol <- unlist(lapply(y,function(y) strsplit(as.character(y),"[.]")[[1]][2]))
  symbol <- gsub("KP","XX",symbol)
  symbol <- gsub("RP","XX",symbol)
  # another method
  library(stringr)
  library(sjmisc)
  symbol <- substr(symbol, 1, nchar(symbol)-1)
  result <- data.frame(pep = symbol,
                       K = NA,
                       R = NA)
  for (i in 1:dim(result)[1]) {

    result$K[i] <- str_contains(result$pep[i],"K")
    result$R[i] <- str_contains(result$pep[i],"R")
  }

  count <- table(result$K)["FALSE"][["FALSE"]] + table(result$R)["FALSE"][["FALSE"]]
  count <- dim(result)[1]* 2 - count
  count_pre <- count
  for (i in 1:dim(result)[1]){
    if (result$K[i] & result$R[i]){
      count <- count - 1
    }
  }
  result_2 <- list(id = dirname,
                   raw_Peptides = raw_Peptides,
                   result = result,
                   count = count,
                   count_pre = count_pre,
                   `Undigestible rate(percentage of count/total)` = count/dim(result)[1])
  print(paste0("Undigestible rate:",count/dim(result)[1]))
  return(result_2)
}
