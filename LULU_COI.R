library(devtools)
library(usethis)
otutab <- read.csv("count_final.txt",sep='\t',header=TRUE,as.is=TRUE, row.names = 1)
matchlist <- read.table("match_list.txt", header=FALSE,as.is=TRUE, stringsAsFactors=FALSE)
library(lulu)
curated_result <- lulu(otutab, matchlist, minimum_ratio_type = "min", minimum_ratio = 1, minimum_match = 84, minimum_relative_cooccurence = 0.95)
save.image(file="curated_result.Rdata")
dim(curated_result$curated_table)
curated_result$curated_count
curated_result$discarded_count
View(curated_result$curated_table)
colSums(curated_result$curated_table[ , 1:5])
write.table(x =curated_result$curated_table, file = "mi_lista.txt")
View(curated_result$curated_otus)
x<-as.data.frame(curated_result[["discarded_otus"]])
View(x)
write.table(x =curated_result[["otu_map"]], file = "otu_map_r")

write.table(x =curated_result$curated_table, file = "curate_table_r.txt")
curated_result$curated_count
curated_result$discarded_count
curated_result$curated_count
head(curated_result$otu_map)
