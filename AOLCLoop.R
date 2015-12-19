#single smiles

AOLCLoop<-function(smiles,generations){
list1<-list()
for(i in 1:generations){
  smiles<-AOLcml.R(unlist(smiles))
  list1[[i]]<-smiles
}
list1
}
