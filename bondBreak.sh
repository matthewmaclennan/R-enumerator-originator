#Run R script; Run obabel script; Run R again.
#AllOriginatorsList in R
#write SMILES to file
#Canonicalize SMILES and output fragments separately in cmd.exe openbabel; write to file
#Reload new file into R
sn<-AllOriginatorsList(smiles)
write.table(paste0(unlist(sn),collapse="\n"),"sn.smi",col.names=F,row.names=F,quote=F)
indirfile<-"C:/Users/Matthew S. MacLennan/Documents/sn.smi"
outdirfile<-"C:/Users/Matthew S. MacLennan/Documents/sn.out2"
#substituting indirfile with the path as character string returns error
system2("cmd.exe",input="babel -ismi \"C:/Users/Matthew S. MacLennan/Documents/sn.smi\" -osmi \"C:/Users/Matthew S. MacLennan/Documents/sn.out2\" --separate -xc")
new<-as.matrix(read.table(outdirfile))
