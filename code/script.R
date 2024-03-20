source("./code/digestion.R")


# digestion ---------------------------------------------------------------
dir <- "F:/fangy/project/jump/sc_protein/sum_20240319_SC_OS_DDA_02/"
result <- digestion(dirname = paste0(dir,"publications/id_uni_pep.txt"))
write.csv(result,file = paste0(dir,"publications/result.csv"))


dir <- "I:/share/home/zhangd/project/jump/20230922_lysis/sum_20230927_lysis04_mol13/"
result <- digestion(dirname = paste0(dir,"publications/id_uni_pep.txt"))
write.csv(result,file = paste0(dir,"publications/result.csv"))

dir <- "I:/share/home/zhangd/project/jump/20230910_NH/sum_20230910_LB03_NH/"
result <- digestion(dirname = paste0(dir,"publications/id_uni_pep.txt"))
write.csv(result,file = paste0(dir,"publications/result.csv"))


