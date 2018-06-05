train_file <- list.files("D:/R/伯嘉_SVD/input/training data/10-fold-Random/Financial_SVD"
                         ,full.name = TRUE ,pattern="[7-9:0].csv$")
test_file <- list.files("D:/R/伯嘉_SVD/input/testing data/10-fold-Random/Financial_SVD" 
                        ,full.name = TRUE ,pattern="[7-9:0].csv$")
l = 1
lists2 <- as.integer()


for (n in 1:4) {
    train <- read.csv(train_file[n])
    train <- train[,-1]
    # train <- train[,-6]
    # train <- train[,-c(11:15)]
    
    test <- read.csv(test_file[n])
    test <- test[,-1]
    # test <- test[,-6]


    train <- t(train)
    test <- t(test)
    lists <- as.integer()
    lists1 <- as.integer()
    z=1
    q=1
    for (x in 1:20) {
      for (y in 1:30) {
        lists[z] <- cor(train[,y] ,test[,x])
        z=z+1
      }
    }

    repeat{
      a = sort(lists[1:30] ,decreasing = T)
      lists1[q] = sum(a[1:5])/5
      q = q+1
      lists = lists[-c(1:30)]
      if(length(lists) == 0) {break}
    }
    repeat{
      b <- rank(lists1[1:5])
      lists2[l] = b[1]
      lists1 = lists1[-c(1:5)]
      l = l + 1 
      if(length(lists1) == 0) {break}
    }
}
write.csv(lists2,"D:/R/伯嘉_SVD/output/10-fold-Random/SVD_Financial/all.csv")
0




