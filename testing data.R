orginal <- read.csv("D:/R/伯嘉_SVD/合併公司/整理/合併v2/2014_2016.csv" ,header = T)
# orginal_svd1 <- orginal_svd[,-1]
# orginal_svd1 <- orginal_svd1[,-c(6:10)]
# orginal_svd1 <- orginal_svd1[,-c(11:15)]

#Generate testing data

for (p in 1:34) {
  dat1 <- orginal[rep(p,each=5),]
  dat2 <- dat1[,1:11]
  dat3 <- dat1[,12:22]

  for (x in 2:11) {
    for (y in 1:5) {
      if(y==1 )
      {next}
      else{
        dat3[y,x] <- sample(orginal[,x+11])[1]
      }
    }
  }

  #taining data
  test_data <- cbind(dat2 ,dat3)
  route <- "D:/R/伯嘉_SVD/input/testing data/LOOCV_Random/Financial+Text/test_data"
  route1 <- paste0(route ,p ,".csv")
  write.csv(test_data,route1)
  
  # a <- orginal_svd1[-p,]
  # route <- "D:/R/伯嘉_SVD/input/training data/LOOCV/Financial/train_data"
  # route1 <- paste0(route ,p ,".csv")
  # write.csv(a,route1)
  # 
}


