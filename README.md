# DDA_digest
 计算jump下机的DDA数据消化情况

```R
# 载入脚本
source("./code/digestion.R")
# digestion ---------------------------------------------------------------
# 输入filter的结果文件夹地址
dir <- "F:/fangy/project/jump/sc_protein/sum_20240319_SC_OS_DDA_02/"
# 计算酶切消化率
result <- digestion(dirname = paste0(dir,"publications/id_uni_pep.txt"))
# 写入结果
write.csv(result,file = paste0(dir,"publications/result.csv"))
```

