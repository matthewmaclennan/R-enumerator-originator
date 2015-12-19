bondbreak<-function(smiles,generations){
list1<-list()
  for(i in 1:generations){
    smiles<-AOLcml.R(unlist(smiles))
    list1[[i]]<-smiles
  }
list1
write.table(paste0(unlist(list1),collapse="\n"),"sn.smi",col.names=F,row.names=F,quote=F)
indirfile<-"C:/Users/Matthew S. MacLennan/Documents/sn.smi"
outdirfile<-"C:/Users/Matthew S. MacLennan/Documents/sn.out2"
#substituting indirfile with the path as character string returns error
#system2("cmd.exe",input="babel -ismi \"C:/Users/Matthew S. MacLennan/Documents/sn.smi\" -osmi \"C:/Users/Matthew S. MacLennan/Documents/sn.out2\" --separate -xc -h")
system2("cmd.exe",input="babel -ismi \"C:/Users/Matthew S. MacLennan/Documents/sn.smi\" -osmi \"C:/Users/Matthew S. MacLennan/Documents/sn.out2\" --separate -xc -xh -h")
new<-read.table(outdirfile)

}

