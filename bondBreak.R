#Run R script; Run obabel script; Run R again.
#AllOriginatorsList in R
#write SMILES to file
#Canonicalize SMILES and output fragments separately in cmd.exe openbabel; write to file
#Reload new file into R
bondbreak<-function(smiles,generations,indirfile,outdirfile){
list1<-list()
  for(i in 1:generations){
    smiles<-AllOriginatorsList(unlist(smiles))
    list1[[i]]<-smiles
  }
list1
write.table(paste0(unlist(list1),collapse="\n"),"sn.smi",col.names=F,row.names=F,quote=F)
#indirfile and outdirfile are the directories and filenames for the input and output files in the openbabel command
indirfile<-indirfile
outdirfile<-outdirfile

#substituting indirfile with the path as character string returns error
#system2("cmd.exe",input="babel -ismi \"C:/Users/Matthew S. MacLennan/Documents/sn.smi\" -osmi \"C:/Users/Matthew S. MacLennan/Documents/sn.out2\" --separate -xc -h")
system2("cmd.exe",input="babel -ismi \"C:/Users/Matthew S. MacLennan/Documents/sn.smi\" -osmi \"C:/Users/Matthew S. MacLennan/Documents/sn.out2\" --separate -xc -xh -h")
new<-read.table(outdirfile)

}

#add explicit H to smiles
write.table(paste0(smiles,collapse="\n"),"sn.smi",col.names=F,row.names=F,quote=F)
system2("cmd.exe",input="babel -ismi \"C:/Users/Matthew S. MacLennan/Documents/sn.smi\" -osmi \"C:/Users/Matthew S. MacLennan/Documents/sn.out2\" --separate -xc -xh -h")
smiles<-read.table(outdirfile)

#include code for replacing explicit hydrogens with fluorines
#include code for finding all combinations of polyfluorinated (partially-fluorinated) compounds
