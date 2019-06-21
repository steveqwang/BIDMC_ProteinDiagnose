data<-read.csv("Desktop/BIDMC/original_data.csv",header = FALSE)
# data<-read.csv("Desktop/BIDMC/original_data.csv",header = FALSE)
data1<-data[2:1308,1:30]#把前两行没有用的删除掉
data<-apply(data1,2,as.numeric)# 把data frame 转码

data = data[c(553,893,318,178,731),]

dataset1 = matrix(1:120, nrow = 4, ncol = 30)
for(i in 1:4){
  for(j in 1:30){
    gap = max(data[i,]) - min(data[i,])
    dataset1[i,j] = (data[i,j]-min(data[i,])) / gap
  }
}

# heatmap(as.matrix(data), scale = "column", col = heat.colors(256), main = "Plot", Colv = NA)

#short_list:1  CXCL8:553 PROC:318 Bicarbonate: 1306 Vesopressor:1307  
# data = data[c(553,318,1306,1307),]
#short_list:2  CXCL8:553 TNFRSF1A:178  Bicarbonate: 1306 Vesopressor:1307  
# data = data[c(553,178,1306,1307),]
#Five protein in the essay: CXCL8:553,IL6:893,PROC:318,TNFRSF1A:178,AGER: 731  
# data = data[c(553,893,318,178,731),]
#All protein: 
# nothing



library(fpc)#这个是用ward 的方法的，看分类
library(NbClust)# 这个是评估分类情况

dataset = as.matrix(dataset1)
dataset = t(dataset)

E.dist <- dist(x = dataset, method = "euclidean")
H1 = hclust(E.dist, method="ward.D2")

#nc<-NbClust(dataset,distance="euclidean",min.nc=2,max.nc = 10, method = "ward.D2")
table(nc$Best.n[1,])
out.id = cutree(H1, k=3)
out.id
a = as.matrix(out.id)
a = t(a)
View(a)

