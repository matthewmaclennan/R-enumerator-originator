#Program to enumerate the (a)cyclic originators for a cyclic molecule based on a SMILES string.
#AllOriginatorsList is a function of the SMILES string or vector of strings ("smi"), whether all bond breaks will be considered 
#(all=TRUE), or if, all=FALSE, the number of bond breaking reactions ("steps") programmed in, 
#and whether the steps applied are dependent on the number of cycles present in the molecule (cyclecounter=TRUE). 
#Enumerating all originators will be considering all possible reactants. Considering only ring-breaking reactants assumes
#the reaction which formed the molecule in question was a cyclization reaction.
#Program places "." character (sequentially) between all adjacent atoms in the string. Also, the ring-representative 
#numerical characters are removed to constitute bond-breaking of atoms which are not adjacent to each other in the SMILES string

AllOriginatorsList<-function(smi){
	smi<-as.matrix(smi)
	list1<-list(list())
	broken<-c()
	
	for(j in 1:length(smi)){
		for(i in 1:nchar(smi[j,])){
			broken<-c(broken,paste0(substr(smi[j,],1,i),".",substr(smi[j,],i+1,nchar(smi[j,]))))
		}
	broken<-broken
    	list1[[j]]<-broken
	}
list1<-list1
}
