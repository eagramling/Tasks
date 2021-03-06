library(phytools)
Reading in previous
tree <- read.tree("http://www.phytools.org//Cordoba2017//data//Anolis.tre") 
plot(tree, type = "fan")
data <- read.csv("https://jonsmitchell.com/data/svl.csv", stringsAsFactors = F, row.names = 1)
# Q2 : dimensions are 100 x 1
dim(data)
svl <- setNames(data$svl, rownames(data))
Ancestors <- fastAnc(tree, svl, vars = TRUE, CI = TRUE)
head(data)
range(svl)
fit <- fastAnc(tree, svl, vars = TRUE, CI = TRUE)
print(fit, printlen = 10)
# Q3 : est. values are "objects
# Q4 : ancestral traits uncertainty and probability of passing the traits 

par(mar = c(0.1, 0.1, 0.1, 0.1))
plot(tree, type = "fan", lwd = 2, show.label = F)

tiplabels(pch = 16, cex = 0.25 * svl[tree$tip.label])
nodelabels(pch = 16, cex = 0.25 * Ancestors$ace)

obj <- contMap(tree, svl, plot = F)
plot(obj, type = "fan", legend =  0.7 * max(nodeHeights(tree)), sig = 2, fsize = c(0.7, 0.9))
 
fossilData <- data.frame(svl = log(c(25.4, 23.2, 17.7, 19.7, 24, 31)), tip1 = c("aliniger", "aliniger", "occultus", "christophei", "cristatellus", "occultus"), tip2 = c("chlorocyanus", "coelestinus", "monticola", "cybotes", "angusticeps", "angusticeps"))

fossilNodes <- c([i, tip1], [1, tip2])
fossilNodes <- c((ti[1 = c("aliniger", "aliniger", "occultus", "christophei", "cristatellus", "occultus"), tip2 = c("chlorocyanus", "coelestinus", "monticola", "cybotes", "angusticeps", "angusticeps"))
nodeN <- c(fossilNodes)

Node <- fastMRCA(tree, fossilData[i, "tip1"], fossilData[i, "tip2"])
fossilNodes[i] <- fossilData[i, "svl"]
nodeN[i] <- Node

names(fossilNodes) <- nodeN
Ancestors_withFossils <- fastAnc(tree, svl, anc.states = fossilNodes, CI = TRUE, var = TRUE)
