data<-read.csv("Desktop/BIDMC/normalized_data.csv",header=FALSE)
data<-data[2:1307,1:30]

data = apply(data, 2, as.numeric)
my_palette <- colorRampPalette(c("red", "black", "green"))(n = 299)


heatmap(as.matrix(data), col=my_palette, scale = "row", main = "Plot", Colv = NA)

