data<-read.csv("Desktop/BIDMC/original_data.csv",header=TRUE)
data_for_p<-data[1:1306,1:30]
group1=c(1,2,5,6,8,9,16,17,18,19,20,22,23,25,27,28,29,30)
group2=c(3,4,7,11,13,15,24,26)
ARDS1<-data_for_p[1:1306,group1]
ARDS2<-data_for_p[1:1306,group2]
#1.2 each: p-value between ards1 and ards2
a=matrix(0,1306,1)
for (i in 1:1306){
  a[i,1]=t.test(as.numeric(data_for_p[i,group1]),as.numeric(data_for_p[i,group2]),var.equal = F)$p.value
}#var.equal default F


#1.3 BH
bh=matrix(0,1306,1)
bh <- p.adjust(a, method = "BH")

result = matrix(0, 1306, 2)


library(gtools)

meanfold <- foldchange(rowMeans(ARDS1), rowMeans(ARDS2))
ARDS1_median <- apply(ARDS1, MARGIN = 1, FUN = median)
ARDS2_median <- apply(ARDS2, MARGIN = 1, FUN = median)
medianfold <- foldchange(ARDS1_median,ARDS2_median)
fold = cbind(meanfold,medianfold)
total_result1 = cbind(a,bh,fold)
write.csv(total_result1, "Desktop/BIDMC/temparary_pvalue.csv")
