`summarize.pomics` <- 
function(scores)
{
    deltas<- scores - min(scores)
    Liks<-exp(-deltas)
    wPomic<-Liks/sum(Liks)
    result<-data.frame(deltas=deltas,Liks=Liks,wPomic=wPomic)
    result
}