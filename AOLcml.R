#analogous to AllOriginatorsList but breaks bonds through *.cml format
#convert smiles to cml through system() command
#break single bond, convert to smiles
#convert db2sb, convert to smiles
#convert tb2db, convert to smiles
#output fragments separately
#save all appended
AOLcml.R<-function(smiles){

#smiles to cml with 3d coords, explicit H
write.table(paste0(smiles,collapse="\n"),"sn.smi",col.names=F,row.names=F,quote=F)
indirfile<-"C:/Users/Matthew S. MacLennan/Documents/sn.smi"
outdirfile<-"C:/Users/Matthew S. MacLennan/Documents/sn.cml"
#substituting indirfile with the path as character string returns error
#system2("cmd.exe",input="babel -ismi \"C:/Users/Matthew S. MacLennan/Documents/sn.smi\" -osmi \"C:/Users/Matthew S. MacLennan/Documents/sn.out2\" --separate -xc -h")
system2("cmd.exe",input="babel -ismi \"C:/Users/Matthew S. MacLennan/Documents/sn.smi\" -ocml \"C:/Users/Matthew S. MacLennan/Documents/sn.cml\" --separate -xm --gen3D -h")
#find single bonds; delete sequentially; convert to smiles; store smiles string
#break single bonds in cml file, convert to smiles which will be stored in a list
#BREAK multi-molecule CML into list of character vectors
list1<-list()
for(i in 1:length(grep("<molecule",readLines("sn.cml")))){
list1[[i]]<-readLines("sn.cml")[grep("<molecule",readLines("sn.cml"))[i]:(grep("</molecule",readLines("sn.cml"))[i])]
}
list1
#For each entry in the list, apply the function
newsmiall<-list()
for(j in 1:length(list1)){
newsmi<-c()
  for(i in 1:length(grep("order=\\\"1\\\"/>",list1[[j]]))){
  write(list1[[j]][-grep("order=\\\"1\\\"/>",list1[[j]])[i]],"if.cml")
  system2("cmd.exe",input="babel -icml \"C:/Users/Matthew S. MacLennan/Documents/if.cml\" -osmi \"C:/Users/Matthew S. MacLennan/Documents/sn.out2\" --separate -xc -xh")
  newsmi<-c(newsmi,readLines("sn.out2"))
  }
newsmi1<-unlist(strsplit(newsmi,"\t[#0-9]*"))
#db2sb
newsmi<-c()
  if(length(grep("order=\\\"2\\\"/>",list1[[j]]))>0){
    for(i in 1:length(grep("order=\\\"2\\\"/>",list1[[j]]))){
  write(gsub(list1[[j]][grep("order=\\\"2\\\"/>",list1[[j]])][i],gsub("order=\\\"2\\\"/>","order=\\\"1\\\"/>",list1[[j]][grep("order=\\\"2\\\"/>",list1[[j]])][i]),list1[[j]]),"if.cml")
  system2("cmd.exe",input="babel -icml \"C:/Users/Matthew S. MacLennan/Documents/if.cml\" -osmi \"C:/Users/Matthew S. MacLennan/Documents/sn.out2\" --separate -xc -xh")
  newsmi<-c(newsmi,readLines("sn.out2"))
    }
newsmi2<-unlist(strsplit(newsmi,"\t[#0-9]*"))
  } else {newsmi2<-NULL}
#tb2db
newsmi<-c()
  if(length(grep("order=\\\"3\\\"/>",list1[[j]]))>0){
    for(i in 1:length(grep("order=\\\"3\\\"/>",list1[[j]]))){
  write(gsub(list1[[j]][grep("order=\\\"3\\\"/>",list1[[j]])][i],gsub("order=\\\"3\\\"/>","order=\\\"2\\\"/>",list1[[j]][grep("order=\\\"3\\\"/>",list1[[j]])][i]),list1[[j]]),"if.cml")
  system2("cmd.exe",input="babel -icml \"C:/Users/Matthew S. MacLennan/Documents/if.cml\" -osmi \"C:/Users/Matthew S. MacLennan/Documents/sn.out2\" --separate -xc -xh")
  newsmi<-c(newsmi,readLines("sn.out2"))
    }
newsmi3<-unlist(strsplit(newsmi,"\t[#0-9]*"))
  } else {newsmi3<-NULL}
#save smiles strings to file
newsmiall[[j]]<-c(newsmi1,newsmi2,newsmi3)
}
newsmifull<-newsmiall
}
