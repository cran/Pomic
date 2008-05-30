`summarize.parameters` <-
function(dataset,colnbparameters,colnbweight,colnbvarparam=NULL)
{
        if(!is.data.frame(dataset)){stop("dataset has to be a data.frame")}
        if(any(colnbparameters>ncol(dataset)) |  colnbweight>ncol(dataset) | length(colnbweight)>1
            | any(colnbvarparam>ncol(dataset)) | ifelse(is.numeric(colnbvarparam),length(colnbvarparam)!=length(colnbparameters),FALSE))
            {stop("Invalid column numbers")}

        dataset_param<-subset(dataset,select=colnbparameters)
        wPomic<-unlist(subset(dataset,select=colnbweight))
        if(is.numeric(colnbvarparam))
              dataset_varparam<-subset(dataset,select=colnbvarparam)

        kbest   <- numeric(length(colnbparameters))
        khat   <- numeric(length(colnbparameters))
        sdkhat   <- numeric(length(colnbparameters))

        for(coln in 1:length(colnbparameters))
        {
                 kbest[coln]   <- dataset_param[which.max(wPomic),coln]
                 khat[coln]    <- sum( dataset_param[,coln]*wPomic )
                 if(is.numeric(colnbvarparam))
                 {
                      sdkhat[coln] <- sum( wPomic * (var(dataset_varparam[,coln]) + (dataset_param[,coln]-khat[coln])^2)^(1/2))
                 }else{
                      sdkhat[coln] <- sum( wPomic * ((dataset_param[,coln]-khat[coln])^2)^(1/2))
                 }
        }

        params <- data.frame(rbind(kbest,khat,sdkhat))
        colnames(params) <- colnames(dataset_param)
        rownames(params) <- c("Kbest","Khat","sdKhat")

        params
}
