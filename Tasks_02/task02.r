setwd("C:\\Users\\ellie\\Desktop\\Evolution\\Tasks\\Tasks_02")
Data <- read.csv("http://jonsmitchell.com/data/beren.csv", stringsAsFactors=F)
Data
length(Data)
nrow(Data)
ncol(Data)
colnames(Data)
head(Data)
Data[1,]
Data[2,]
Data[1:3,]
Data[1:3, 4]
Data[1:5, 1:3]
Feeds <- which(Data[,9] =="bottle")
berenMilk <- Data[Feeds,]
Feeds <-which(Data[,"event"] == "bottle")
Feeds <- which (Data$event == "bottle")
head(berenMilk)
nrow(Data)
rownames(Data)
dayID <- apply(Data, 1, function(x) paste (x[1:3], collapse="-"))
dateID <- sapply(dayID, as.Date, format = "%Y-%m%d", origin = "2019-04-18")
Data$age <- dateID - dateID[which(Data$event == "birth")]
head(Data)
beren2 <- Data
beren3 <- beren2[order(beren2$age),]
write.csv(beren3, "beren_new.csv", quote=F, row.names=FALSE)












