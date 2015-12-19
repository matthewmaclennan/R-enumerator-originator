AllMakers<-function(){

#Find non-Hydrogen atoms
nonH<-readLines("C:\\Users\\Matthew S. MacLennan\\Desktop\\New Text Document.txt")[grep("elementType=(?!\\\"H\\\")",
    readLines("C:\\Users\\Matthew S. MacLennan\\Desktop\\New Text Document.txt"),perl=T)]
#List ids for these atoms
unlist(lapply(strsplit(nonHatom,"\\\""),function(x) x[2]))
#List all combinations of bonds
combos<-as.matrix(expand.grid(unlist(lapply(strsplit(nonHatom,"\\\""),function(x) x[2])),
    unlist(lapply(strsplit(nonHatom,"\\\""),function(x) x[2]))))
#List already existing single bond connections
bonds<-readLines("C:\\Users\\Matthew S. MacLennan\\Desktop\\New Text Document.txt")[grep("bond atomRefs",
    readLines("C:\\Users\\Matthew S. MacLennan\\Desktop\\New Text Document.txt"),perl=T)]
bondlist<-unlist(lapply(strsplit(bonds,"\\\""),function(x) x[2]))
#Number bonds?
#create string for new conections




#enumerate double bonds




#enumerate triple bonds




}
