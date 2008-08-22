\name{Pomic-package}
\alias{Pomic-package}
\alias{Pomic}
\docType{package}
\title{
Pattern Oriented Modeling Information Criterion for ABM/IBM
}
\description{
This package propose calculations of a non-parsimonious based information criterion to check the quality of simulations results of ABM/IBM or other non-linear rule-based models. The POMIC is based on the KL divergence and likelihood theory. These methods are still under development and further work are needed for the incorporation of model complexity measurement in the information criterion.
}
\details{
\tabular{ll}{
Package: \tab Pomic\cr
Type: \tab Package\cr
Version: \tab 0.9.1\cr
Date: \tab 2008-22-08\cr
License: \tab GPL-2\cr
}
The \link{pomic} function is for distribution patterns.

The \link{pomic.timeseries} is for autocorrelated patterns.

The \link{pomic.simple} function is to obtain only the POMIC value.

The \link{pomic.corrected} function is to obtain raw approximation of KL divergence for multiple patterns means.

The \link{analyse.pomics} function is for secondary analysis of pomic results (weights of evidence and parameter averaging).

The \link{summarize.pomics} function is for weights of evidence calculation from pomic results.

The \link{summarize.parameters} function is for parameter averaging from weights of evidence.

}
\author{
Cyril Piou
\cr
\email{cyril.piou@yahoo.fr}
}
\references{
Piou 2007, Patterns and individual-based modeling of spatial competition within two main components of Neotropical mangrove ecosystems. PhD thesis, University of Bremen. \url{http://elib.suub.uni-bremen.de/diss/docs/00010671.pdf} 

Piou et al. Proposing an information criterion for individual-based models developed in a pattern-oriented modeling framework. In preparation.
}

\keyword{ misc }
\keyword{ utilities }
\keyword{ programming }

\seealso{\code{\link{pomic}} \code{\link{analyse.pomics}} \code{\link{pomic.simple}} \code{\link{pomic.corrected}} \code{\link{pomic.timeseries}} }

\examples{
#example of field pattern distribution:        
fieldpattern<-rnorm(100,10,5)
#model results:
model1runs<- rnorm(100*5,10.5,6)
model2runs<- rnorm(100*5,9.5,2)
#POMIC measurements:
pomic(fieldpattern,model1runs,eps=10^-20,plotting=TRUE)
pomic(fieldpattern,model2runs,eps=10^-20,plotting=TRUE)
pomic.simple(fieldpattern,model2runs,eps=10^-20)
pomic.corrected(fieldpattern,model1runs,eps=10^-20)
pomic.corrected(fieldpattern,model2runs,eps=10^-20)

#An analysis with random POMIC scores:
dataset<-data.frame(P1=rep(1:5,each=5),P2=rep(seq(0,5,length=5),5),
                    pomics=runif(25)*20)
analyse.pomics(dataset,c(1,2),3)

#example for time series patterns:
timeserie<-runif(100)+1:100-(seq(1,10,length=100)^2)
model<-NULL
for(i in 1:100){  
  model<-cbind(model,runif(100)+1:100-(seq(1,10,length=100)^2.01)) 
}
pomic.timeseries(timeserie,model,eps=10^-20,fullmsd=TRUE,
                  plotting=TRUE,half_window_size=10,
                  check_whole=TRUE,check_diffs=TRUE)


}
