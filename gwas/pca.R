eigen <- data.frame(read.table("hear_losing.eigenvec", header=FALSE, sep=""))
eigval <- data.frame(read.table("hear_losing.eigenval", header=FALSE, sep=""))
hear_losing <- data.frame(read.csv("hear_losing_value.csv"))
eigen_o <- eigen[order(eigen$V1),]
hear_losing_o <- hear_losing[order(hear_losing$TWB2_ID),]

eigen_o$I_32 <- hear_losing_o$I_32
colnames(eigen_o)[3:4] <-c(sprintf("PC1(%s％)", round(eigval[1,]/sum(eigval)*100,2)),sprintf("PC2(%s％)", round(eigval[2,]/sum(eigval)*100,2)))
#eigen_o$I_32 <- as.factor(eigen_o$I_32)
eigen_o$I_32 <- cut(eigen_o$I_32, breaks = c(-Inf,99,Inf), labels = c("<100","100"))
hear_losing_o$I_32
library(ggplot2)
ggplot(eigen_o %>% arrange(eigen_o$I_32), aes(x = eigen_o$`PC1(16.46％)`, y = eigen_o$`PC2(7.99％)`,color =I_32))+ 
  geom_point(size=2)+
  xlab('PC1(16.46%)') +
  ylab("PC2(7.99%)")

origin <- dataset
names(origin) <- c('X','TWB2_ID','origin')
origin_o <- origin[order(origin$TWB2_ID),]
eigen_o$origin <- origin_o$origin
ggplot(eigen_o, aes(x = eigen_o$`PC1(16.46％)`, y = eigen_o$`PC2(7.99％)`,color =origin))+ 
  geom_point(size=2)+
  xlab('PC1(16.46%)') +
  ylab("PC2(7.99%)")

colnames(eigen_o)[5] <-c(sprintf("PC3(%s％)", round(eigval[3,]/sum(eigval)*100,2)))
#eigen_o$I_32 <- as.factor(eigen_o$I_32)
eigen_o$I_32 <- cut(eigen_o$I_32, breaks = c(-Inf,0,Inf), labels = c("Control","Case"))

library(ggplot2)
ggplot(eigen_o %>% arrange(eigen_o$I_32), aes(x = eigen_o$`PC2(7.99％)`, y = eigen_o$`PC3(6.59％)`,color =I_32))+ 
  geom_point(size=2)+
  xlab('PC2(7.99%)') +
  ylab("PC3(6.59%)")

