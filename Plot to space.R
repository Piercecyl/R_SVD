inputdata <- read.csv("D:/R/伯嘉_SVD/input/SVD.csv", sep = ",", header = T)
inputtest <- read.csv("D:/R/伯嘉_SVD/input/小樣本/test_svd.csv" ,sep=",",header = T)
# inputdata1 <- read.csv("D:/R/伯嘉_SVD/合併公司/整理/合併v2/合併V3/2014_2016.csv")
inputdata1 = as.matrix(inputdata[,-1])
inputdata1 <- dist(inputdata1)
ma.mds = cmdscale(inputdata1,k=10,eig=T)

inputtest1 = as.matrix(inputtest[,-1])
inputtest1 <- dist(inputtest1)
ma.mds1 = cmdscale(inputtest1,k=2,eig=T)
#计算前两个特征值在所有特征值中的比例，
#为了检测能否用两个维度的距离来表示高维空间中距离，
#如果达到了0.8左右则表示是合适的。
sum(abs(ma.mds$eig[1:2]))/sum(abs(ma.mds$eig))
sum((ma.mds$eig[1:2])^2)/sum((ma.mds$eig)^2)

plot(ma.mds$points[,1], ma.mds$points[,2], cex = 0.4 ,xlab="Dimension 1", ylab="Dimension 2",main ="SVD" ,col="black")
text(ma.mds$points[,1], ma.mds$points[,2], labels = inputdata$name, cex = 0.8 ,col = "black")
points(ma.mds1$points[,1], ma.mds1$points[,2] , col = "red")
plot(ma.mds1$points[,1], ma.mds1$points[,2] )


