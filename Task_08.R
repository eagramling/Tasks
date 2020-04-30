library(phytools)
text.string <- "(((((((cow, pig), whale), (bat, (lemur, human))), (robin, iguana)), coelacanth), (gold_fish, trout)), shark);"
vert.tree <- read.tree(text = text.string)
plot(vert.tree, edge.width = 2)

nodelabels(frame = "circle", bg = 'white', cex = 1)
#Q1 : sharks

vert.tree
str(vert.tree)
#Q2 : nope. not lengths 

tree <- read.tree(text = "(((A, B), (C, D)), E);")
plotTree(tree, offset = 1)
tiplabels(frame = "circle", bg = 'lightblue', cex = 1)
nodelabels(frame = "circle", bg = 'white', cex = 1)

tree$tip.label

tree$edge

AnolisTree <- force.ultrametric(read.tree("http://jonsmitchell.com/data/anolis.tre"))
par(las = 1)
hist(AnolisTree$edge.length, col = 'black', border = 'white', main = "", xlab = "edge lengths for the Anolis Tree", ylim = c(0, 50), xlim = c(0, 6))

tipEdges <- which(AnolisTree$edge[,2] <= Ntip(AnolisTree))
Lengths <- AnolisTree$edge.length
names(Lengths) <- AnolisTree$tip.label
names(Lengths)[which(Lengths == min(Lengths))]

plot(AnolisTree, cex = 0.25)
Labs <- sapply(AnolisTree$edge.length, round, digits = 2)
edgelabels(text = Labs, cex = 0.25)

#Q4 :
roundPhylogram(vert.tree)

#Q5 :
tiplabels(frame = "circle", bg = 'red', cex = 1)

#Q6-Q9 :
Lengths <- vert.tree
names(Lengths) <- vert.tree
names(Lengths)[which(Lengths == min(Lengths))]

ltt(AnolisTree)
abline(0, 1, lwd = 2, col = 'red', lty = 2)

#Q10 :
fit.bd(AnolisTree, rho = 0.2)
install.packages("treebase")
