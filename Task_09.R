library(phytools)
tree <- read.tree 
plot(tree, type = "fan")
data <- read.csv("https://jonsmitchell.com/data/svl.csv", stringsAsFactors = F, row.names = 1)

svl <- setNames(data$svl, rownames(data))
Ancestors <- fastAnc(tree, svl, vars = TRUE, CI = TRUE)

par(mar = c(0.1, 0.1, 0.1, 0.1))
plot(tree, type = "fan", lwd = 2, show.label = F)

tiplabels(pch = 16, cex = 0.25 * svl[tree$tip.label])
nodelabels(pch = 16, cex = 0.25 * Ancestors$ace)

obj <- contMap(tree, svl, plot = F)
plot(obj, type = "fan", legend =  0.7 * max(nodeHeights(tree)), sig = 2, fsize = c(0.7, 0.9))
 
fossilData <- data.frame(svl = log(c(25.4, 23.2, 17.7, 19.7, 24, 31)), tip1 = c("aliniger", "aliniger", "occultus", "christophei", "cristatellus", "occultus"), tip2 = c("chlorocyanus", "coelestinus", "monticola", "cybotes", "angusticeps", "angusticeps"))

fossilNodes <- c()
nodeN <- c()

Node <- fastMRCA(tree, fossilData[i, "tip1"], fossilData[i, "tip2"])
fossilNodes[i] <- fossilData[i, "svl"]
nodeN[i] <- Node

names(fossilNodes) <- nodeN
Ancestors_withFossils <- fastAnc(tree, svl, anc.states = fossilNodes, CI = TRUE, var = TRUE)
