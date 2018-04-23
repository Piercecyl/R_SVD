inputdata <- read.csv("D:/R/伯嘉_SVD/input/test.csv", sep = ",", header = T)
svd_input <- svd(inputdata)
svd_input
#奇異值百分比
plot(svd_input$d^2 / sum(svd_input$d^2)*100, ylab="Percent variability explained")

u <- svd_input$u
d <- diag(svd_input$d)
v <- svd_input$v

# D = 3 
#奇異值3 or 5就可以將目前現有的值投射到維度(sigular space)
#要能把training M&A (成功案例)與test M&A (預測案例)一對對向量都能投到singular space上。
u1 <- as.matrix(u[, 1:3])
d1 <- as.matrix(d[1:3, 1:3])
v1 <- as.matrix(v[, 1:3])
num1 <- u1 %*% d1 %*% t(v1)

write.csv(num1 ,"D:/R/伯嘉_SVD/input/test_svd.csv")



