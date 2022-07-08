data <- read.csv('PC1.DR.glm.logistic.hybrid',sep='\t')
data <- data[data$ERRCODE == '.',]
data <- data[grepl("^LG", data$X.CHROM),]
library(qqman)
library(dplyr)
dat<- data %>%
  select(X.CHROM, POS, P)
colnames(dat) <- c("CHR","BP","P")
dat$SNP <- paste(dat$CHR, dat$BP, sep="_")
dat$CHR <- plyr::mapvalues(dat$CHR, from=levels(dat$CHR), to=1:length(levels(dat$CHR))) %>% as.numeric()
manhattan(dat, chr="CHR", bp="BP", snp="SNP", p="P" , annotatePval = 0.01,cex.axis = 0.9,main = "Manhattan Plot", ylim = c(0, 4),col = c("blue4", "orange3"),suggestiveline=F, genomewideline = 3, chrlabs = c(levels(data$X.CHROM)[1:22]))
qq(dat$P)

