AllMakers<-function(){

#Find non-Hydrogen atoms
nonHatom<-readLines("C:\\Users\\Matthew S. MacLennan\\Desktop\\New Text Document.txt")[grep("elementType=(?!\\\"H\\\")",
    readLines("C:\\Users\\Matthew S. MacLennan\\Desktop\\New Text Document.txt"),perl=T)]
#List ids for these atoms
unlist(lapply(strsplit(nonHatom,"\\\""),function(x) x[2]))
#List all combinations of bonds
combos<-as.matrix(expand.grid(unlist(lapply(strsplit(nonHatom,"\\\""),function(x) x[2])),
    unlist(lapply(strsplit(nonHatom,"\\\""),function(x) x[2]))))
#List already existing single bond connections
bonds<-readLines("C:\\Users\\Matthew S. MacLennan\\Desktop\\New Text Document.txt")[grep("bond atomRefs.+order=\\\"1\\\"",
    readLines("C:\\Users\\Matthew S. MacLennan\\Desktop\\New Text Document.txt"),perl=T)]
bondlist<-unlist(lapply(strsplit(bonds,"\\\""),function(x) x[2]))
#Number bonds?
bondlistidmat<-matrix(unlist(strsplit(bondlist," ")),ncol=2,byrow=T)
nonHatomId<-unlist(lapply(strsplit(nonHatom,"\\\""),function(x) x[2]))
nonHatomIdBondList<-bondlistidmat[bondlistidmat[,1] %in% nonHatomId & bondlistidmat[,2] %in% nonHatomId,]
nhaidblm<-apply(expand.grid(nonHatomId,nonHatomId),1,function(x) paste0(x[1]," ",x[2]))
###############
newbonds<-c()
for(i in 1:length(nonHatomId)){
	for(j in 1:length(nonHatomId)){

		if(j>i){
			newbonds<-c(newbonds,paste0(nonHatomId[i]," ",nonHatomId[j]))
		} else {is.null(j)}
	
		newbonds
	}
newbonds

}

inserts<-paste0("<bond atomRefs2=\"",newbonds,"\"order=\"1\"/>")
#





#enumerate double bonds




#enumerate triple bonds




}
