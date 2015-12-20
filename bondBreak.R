#Run R script; Run obabel script; Run R again.
#AllOriginatorsList in R
#write SMILES to file
#Canonicalize SMILES and output fragments separately in cmd.exe openbabel; write to file
#Reload new file into R
bondbreak<-function(smiles,generations){
list1<-list()
for(j in 1:length(smiles)){
  genlist<-list()
    for(i in 1:generations){
      smiles<-AllOriginatorsList(unlist(smiles))
      genlist[[i]]<-smiles
    }
  

genlist
write.table(paste0(unlist(genlist),collapse="\n"),"sn.smi",col.names=F,row.names=F,quote=F)
indirfile<-"C:/Users/Matthew S. MacLennan/Documents/sn.smi"
outdirfile<-"C:/Users/Matthew S. MacLennan/Documents/sn.out2"
#substituting indirfile with the path as character string returns error
#system2("cmd.exe",input="babel -ismi \"C:/Users/Matthew S. MacLennan/Documents/sn.smi\" -osmi \"C:/Users/Matthew S. MacLennan/Documents/sn.out2\" --separate -xc -h")
system2("cmd.exe",input="babel -ismi \"C:/Users/Matthew S. MacLennan/Documents/sn.smi\" -osmi \"C:/Users/Matthew S. MacLennan/Documents/sn.out2\" --separate -xc -xh -h")
list1[[j]]<-read.table(outdirfile)

}
list1
}

#add explicit H to smiles
write.table(paste0(smiles,collapse="\n"),"sn.smi",col.names=F,row.names=F,quote=F)
system2("cmd.exe",input="babel -ismi \"C:/Users/Matthew S. MacLennan/Documents/sn.smi\" -osmi \"C:/Users/Matthew S. MacLennan/Documents/sn.out2\" --separate -xc -xh -h")
smiles<-read.table(outdirfile)
