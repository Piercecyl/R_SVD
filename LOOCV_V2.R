ori <- read.csv("D:/R/伯嘉_SVD/合併公司/整理/合併v2/2014_2016.csv")
ori <- ori[,c(-1,-12)]
#Normalization
ori <- data.frame(scale(ori,center = T , scale = T))
#Build Funtion
cos <- function(x, y) {
  c = sum(x * y)  
  d = sqrt(sum(x * x)) * sqrt(sum(y * y))
  e = c / d 
  return(e)
}
#Golbal
count = 1
count1 = 1
l = 1
result_list = 0
ave_test = 0
fin_lists = 0
#main

for (x in 1:30){
  train <- ori[-x,]
  test <- ori[x,]  
  #Gernerate testing data
  test <- test[rep(1,each=5),]
  for (test_col in 11:20) {
    for (test_row in 1:5) {
      if(test_row==1)
      {next}
      else{
        test[test_row,test_col] <- sample(ori[,test_col] ,1)
      }
    }
  }
  #cos
  
  for (test_x in 1:5) {
    for (train_x in 1:29) {
      result_list[count] <- cos(train[train_x,] ,test[test_x,])
      count = count + 1 
    }
    count = 1
    ave_test[count1] = sum(sort(result_list ,decreasing = T)[1:5])/5
    count1 = count1 + 1
  }
  
  fin_lists[l] <- rank(ave_test[1:5])[1]
  l=l+1
  count1 = 1
  
  lists <- ceiling(fin_lists)
  lists[lists == 1]=20
  lists[lists == 2]=25
  lists[lists == 3]=33
  lists[lists == 4]=50
  lists[lists == 5]=100
  
}


all <- sum(lists)/30
all