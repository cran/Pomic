`pomic.timeseries` <-
function(object1, object2, eps=10^-30, nrange=1000,
		fullmsd=FALSE,  plotting=FALSE, timevector=NULL, 
    half_window_size=5,check_whole=TRUE,check_diffs=FALSE,...)
{
	if(!is.numeric(object1) | !is.numeric(object2) | !nrow(object2)==length(object1))
	stop("objects must be numeric \n please give object1 as vector and object2 as matrix ")

  if(is.null(timevector)) timevector <- 1:length(object1)

  if(is.ts(object1)) timevector <-  time(object1)
  
  if(is.ts(object2) & is.ts(object1) & any(time(object2)!= time(object1)))
	stop("You are using time series of different time !")
	
  nb_scores<-length(object1) + ifelse(check_diffs, length(object1)-1,0) + ifelse(check_whole, 1,0)

	z <- matrix(NA, nrow=2, ncol=nb_scores)
	rownames(z) <- c("POMIC","nb_points")

  if(check_diffs)
  {
      do1 <- diff(object1)
      do2 <- diff(object2)
      interval<- length(object1)
  }

  #for MSD  
  fullmsdres <- 0
  mo1 <- mean(object1)
  sdo1 <- sd(object1)
  ob1rel <- (object1-mo1)/sdo1
  
  for(rown in 1:nrow(object2))
  {
      indexs <- (rown-half_window_size):(rown+half_window_size)
      indexs <- indexs[sign(indexs)>0 & indexs<length(object1)]
      to1 <- object1[indexs]
      to2 <- unlist(object2[indexs,])
      
      z[1,rown] <- pomic.simple(to1,to2,eps,nrange)
      z[2,rown] <- length(to1) 
      
      if(check_diffs & rown!=nrow(object2))
      {
          tdo1 <- do1[indexs]
          tdo2 <- unlist(do2[indexs,])
          
          z[1,rown+interval] <- pomic.simple(tdo1,tdo2,eps,nrange)
          z[2,rown+interval] <- length(tdo1)
      }
     	
     ob2rel <- (object2[rown,]-mo1)/sdo1
     fullmsdres <- fullmsdres + sum((ob1rel[rown]-ob2rel)^2)  

  }
  
  if(check_whole)
  {
     	z[1,ncol(z)] <- pomic.simple(object1,as.vector(object2),eps,nrange)  
     	z[2,ncol(z)] <- length(object1)
 	}
	
	if(plotting)
	{
		old.par <- par(no.readonly = TRUE)

		par(mfrow=c(2,2))

    if(is.ts(object1)) object1<-as.vector(object1); timevector<- as.vector(timevector)
    if(is.ts(object2)) object2 <- matrix(object2,nrow=length(object1))
    
		plot(timevector,object1,type="l",main="Field pattern and model fit (green)",xlab="Time",ylab="Focus variable")
		lines(timevector,apply(object2,1,mean),col=3)
		lines(timevector,apply(object2,1,mean)+1.96*apply(object2,1,sd),lty=2,col=3)
		lines(timevector,apply(object2,1,mean)-1.96*apply(object2,1,sd),lty=2,col=3)
		plot(timevector,apply(object2,1,mean),type="l",main="Model pattern",xlab="Time",ylab="Focus variable",col=3)
		lines(timevector,apply(object2,1,mean)+1.96*apply(object2,1,sd),lty=2,col=3)
		lines(timevector,apply(object2,1,mean)-1.96*apply(object2,1,sd),lty=2,col=3)
		plot(density(as.vector(object2)),main="Model pattern density on free range \n and field points",xlab="Focus variable")
		points(object1,rep(0,length(object1)),pch=3,col=2)
		plot(0:1,0:1,type="n",axes=FALSE,frame.plot=FALSE,xlab="",ylab="",...)
		text(0.5,0.5,paste("Information about the density function: \n  n points=",nrange,"\n\n Sum pomic score=",round(sum(z[1,]),3),"\n Total nb points checked=",sum(z[2,]),sep=" "))
  	
		on.exit(par(old.par))
	}
	simpleresult<-rbind(sum(z[1,]),sum(z[2,]),fullmsdres)
	rownames(simpleresult)<-c("SumPOMICs","Sum_nb_points","MSD_relative")
	pomic<-list(field_data=object1,sim_data=object2,simpleresult=simpleresult,result=z)
	pomic
}

