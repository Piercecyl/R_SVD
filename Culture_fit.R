library(tm)
library(jiebaR)


codelist1 <- as.integer()
dic <- readLines("D:/R/伯嘉_SVD/Textual variables/supply.txt")
engine <- worker()
new_user_word(engine , dic)
dir.list = list.files("C:/Users/yolin/Desktop/123" , full.name = TRUE)

for(i in 1:length(dir.list)){
  file1 = dir.list[i]
  s1 =readLines(file1,encoding="ANSI")
  s1 = toString(s1)
  segment <- engine[s1]
  temp <- which(segment %in% dic)
  #判斷該篇文章有沒有詞庫裡的字
  codelist1[i] <- length(temp)
}

a <- cbind(dir.list ,codelist1)
write.csv(a ,"D:/R/伯嘉_SVD/年報/output/supply.csv")
