`analyse.pomics` <-
function(dataset,colnbparameters,colnbpomic,colnbvarparam=NULL,order=TRUE)
{
        if(!is.data.frame(dataset)){stop("dataset has to be a data.frame")}
        if(any(colnbparameters>ncol(dataset)) |  colnbpomic>ncol(dataset) | length(colnbpomic)>1
            | any(colnbvarparam>ncol(dataset)) | ifelse(is.numeric(colnbvarparam),length(colnbvarparam)!=length(colnbparameters),FALSE))
            {stop("Invalid column numbers")}
            
        dataset_param<-subset(dataset,select=colnbparameters)
        scores<-unlist(subset(dataset,select=colnbpomic))
        if(is.numeric(colnbvarparam))
              dataset_varparam<-subset(dataset,select=colnbvarparam)
        
        addata <- summarize.pomics(scores)
        
        dataset<-cbind(dataset,addata)
        if(order) dataset<-dataset[order(scores),]
        
        params <- summarize.parameters(dataset,colnbparameters,ncol(dataset),colnbvarparam)
        
        results<-list(dataset=dataset,params=params)
        results
}
