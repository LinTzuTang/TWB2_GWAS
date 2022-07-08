# load plink assoc data
hear_losing <- read.table('hear_losing.qassoc', sep ='', header = TRUE)

# manhattan plot
library(qqman)
manhattan(hear_losing, chr = "CHR", bp = "BP", p = "P", snp = "SNP",
          col = c("gray10", "gray60"), chrlabs = NULL,
          suggestiveline = -log10(1e-05), genomewideline = -log10(5e-08),
          highlight = NULL, logp = TRUE, annotatePval = NULL,
          annotateTop = TRUE)

