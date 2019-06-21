library(mclust)#4 group 的方法， data 还是一样子去取，column是 sample

data<-read.csv("Desktop/Harvard/DataAllSet/paper_4protein.csv",header = FALSE)
data1<-data[c(6:9),7:45]#把前两行没有用的删除掉
data1 <- data1[-c(1,3,4),];

data2<-apply(data1,2,as.numeric)
library(fpc)
E.dist <- dist(x=data2, method="euclidean")

par(mar = rep(2, 4))
result = plot(hclust(E.dist,method="ward.D2"),xlab="ward")

library(NbClust)# 这个是评估分类情况
nc<-NbClust(data2,distance="euclidean",min.nc=2,max.nc = 10,method =  "ward.D2")

table(nc$Best.n[1,])
