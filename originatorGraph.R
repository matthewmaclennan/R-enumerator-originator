#Sequences of originator steps as igraph objects
require(igraph)
for(i in 1:length()){
graph.edgelist(matrix(cbind(sn[[1]][i],tn[[i]]),ncol=2))
}
