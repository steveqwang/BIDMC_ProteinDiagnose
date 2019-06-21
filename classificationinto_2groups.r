data<-read.csv("/Users/hayashishishin/Desktop/未命名文件夹 3/4group.csv",header = FALSE)
data1<-data[3:1311,]#把前两行没有用的删除掉
data1<-data1[-c(2,3),]#去掉ards/normal行 
data1#1307   31
datapre<-data1[2:1307,2:31]
datapre<-apply(datapre,2,as.numeric)# 把data frame 转码
library(fpc)#这个是用ward 的方法的，看分类
E.dist <- dist(x = dataset, method = "euclidean")
plot(hclust(E.dist,method="ward.D2"),xlab="ward")
datac1<-data[,c(18,25,26,28,3,12,9,14,4,13,5,10,11,2,6,7,8)]
datac2<-data[,c(23,20,24,19,16,22,17,15,21,29,31,27,30)]
datac<-cbind(data[,1],datac1,datac2)
write.csv(datac,file = "/Users/hayashishishin/Desktop/未命名文件夹 3/2groupwithbc.csv")
library(NbClust)# 这个是评估分类情况
nc<-NbClust(datapre,distance="euclidean",min.nc=2,max.nc = 10,method =  "ward.D2")
table(nc$Best.n[1,])
nur_fit_cut<-cutree(nur_fit)