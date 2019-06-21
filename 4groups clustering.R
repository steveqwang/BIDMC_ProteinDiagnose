library(mclust)#4 group 的方法， data 还是一样子去取，column是 sample
dataset<-scale(t(data[,1:30]))
m_clust<-Mclust(as.matrix(dataset),G=2:5)# G=2:5 是选择聚类个数
a=summary(m_clust)#调用a 看结果 
plot(m_clust,"BIC")
# V1  V2  V3  V4  V5  V6  V7  V8  V9 V10 V11 V12 V13 V14 V15 V16 V17 V18 V19 V20 V21 V22 V23 V24 V25 V26 
#1   1   2   2   1   3   2   1   2   3   2   4   2   4   2   2   1   1   1   1   4   1   1   2   1   2 
#V27 V28 V29 V30 
#2   1   1   3 
dataset=scale(dataset)#这一步可以有可以不要都行 

pamk_best<-pamk(dataset)