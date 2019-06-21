

library(corrplot)
data<-read.csv("Desktop/Harvard/LSC/samples_separation.csv",header = FALSE)
dataA = data[, c(2:31)]
dataA = dataA[c(16:1322),]
#1	1	1	1	1	1	1	1	1	1	1	1	1	2	2	2	2	2	2	2	2	2	2	2	1	1	1	2	2	2


for(i in 1:30){
  dataA[[i]] = as.numeric(dataA[[i]])
}

# res = cor(data[2:41])
# rws2= round(res, 8)

ttest = matrix(1:2614, nrow = 1307, ncol = 2, dimnames = list())

for(j in 1:1307){
  p1 = matrix(1:60, nrow = 20, ncol = 3, dimnames = list())
  for(i in 1:16){
    p1[i, 1] = as.numeric(dataA[j,i])
  }
  for(i in 1:14){
    p1[i, 2] = as.numeric(dataA[j,i+16])
  }
  p = t.test(p1[,1], p1[,2])
  
  p$p.value
  ttest[j, 1] = as.numeric(p$p.value)
}

q = p.adjust(ttest[,1],method = 'BH')
ttest[, 2] = q
write.csv(ttest, file = "Desktop/Harvard/result_ttest.csv")


