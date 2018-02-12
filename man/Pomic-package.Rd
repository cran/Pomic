\name{Pomic-package}
\alias{Pomic-package}
\alias{Pomic}
\docType{package}
\title{
Pattern Oriented Modeling Information Criterion for ABM/IBM
}
\description{
Calculations of an information criterion are proposed to check the quality of simulations results of Agent-based models (ABM/IBM) or other non-linear rule-based models. The POMDEV measure (Pattern Oriented Modelling DEViance) is based on the Kullback-Leibler divergence and likelihood theory. It basically indicates the deviance of simulation results from field observations. Once POMDEV scores and metropolis-hasting sampling on different model versions are effectuated, POMIC scores (Pattern Oriented Modelling Information Criterion) can be calculated. This method could be further developed to incorporate multiple patterns assessment.
}
\details{
\tabular{ll}{
Package: \tab Pomic\cr
Type: \tab Package\cr
Version: \tab 1.0.4\cr
Date: \tab 2018-02-09\cr
License: \tab GPL-2\cr
}
The \link{pomdev} function is for distribution patterns. It is computed as in Piou et al. (2009) It corresponds to twice the sum of the log of an approximated likelihood given by the approximating function of density from the simulation results applied on the field data.

The \link{pomdev.extra} function is to obtain POMDEV scores as well as other goodness of fit indicators.

The \link{pomdev.corrected} function is to obtain raw approximation of KL divergence.

The \link{pomdev.ts} function is for time series patterns. It is still under evaluation.

Type \code{demo(demoPomic)} for a demonstration of POMIC calculation as in appendix B of Piou et al. (2009).

And type \code{demo{verification}} for the verification of the first demonstration (as in appendix C of  Piou et al. (2009)).

}
\author{
Cyril Piou
\cr
\email{cyril.piou@cirad.fr}
}
\references{
Piou 2007, Patterns and individual-based modeling of spatial competition within two main components of Neotropical mangrove ecosystems. PhD thesis, University of Bremen. \url{http://elib.suub.uni-bremen.de/diss/docs/00010671.pdf} 

Piou, C., U. Berger, and V. Grimm. 2009. Proposing an information criterion for individual-based models developed in a pattern-oriented modelling framework. Ecological Modelling 220:1957-1967. \url{http://dx.doi.org/10.1016/j.ecolmodel.2009.05.003}
}

\keyword{ misc }
\keyword{ utilities }
\keyword{ programming }

\seealso{\code{\link{pomdev}} \code{\link{pomdev.ts}} \code{\link{pomdev.extra}} \code{\link{pomdev.corrected}} }

\examples{
#example of field pattern distribution:        
fieldpattern<-rnorm(100,10,5)
#model results:
model1runs<- rnorm(100*5,10.5,6)
model2runs<- rnorm(100*5,9.5,2)
#POMDEV measurements:
pomdev.extra(fieldpattern,model1runs,eps=10^-20,plotting=TRUE)
pomdev.extra(fieldpattern,model2runs,eps=10^-20,plotting=TRUE)
pomdev(fieldpattern,model2runs,eps=10^-20)
pomdev.corrected(fieldpattern,model1runs,eps=10^-20)
pomdev.corrected(fieldpattern,model2runs,eps=10^-20)

#other examples of POMDEV measures:
pomdev(x<-rnorm(100),y<-rnorm(100,0.1)) 
#POMDEV value for a model creating a normal distribution 
#with identical variance as the field data but a mean 0.1 
#away from the field data
par(mfrow=c(2,2))
hist(x,freq=FALSE) #plot the field data as histogram
lines(density(y))#check the simulation results distribution as line
pomdev(x<-rnorm(100),y<-rnorm(100,0.2)) #idem 0.2 away from the field data
hist(x,freq=FALSE); lines(density(y)) #plot
pomdev(x<-rnorm(100),y<-rnorm(100,1))   #idem 1 away from the field data
hist(x,freq=FALSE); lines(density(y)) #plot
pomdev(x<-rnorm(100),y<-rnorm(100,3))   #idem 3 away from the field data
hist(x,freq=FALSE); lines(density(y)) #plot

\dontrun{demo(demoPomic)}
\dontrun{demo(verification)}

}
