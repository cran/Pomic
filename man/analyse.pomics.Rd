\name{analyse.pomics}
\alias{analyse.pomics}
\title{ Analyse a data frame with parameter values and pomic scores }
\description{
  This function calculate the POMIC weights values and do parameter averaging.
}
\usage{
analyse.pomics(dataset,colnbparameters,colnbpomic,colnbvarparam=NULL,order=TRUE)
}
\arguments{
  \item{dataset}{ Numerical, a dataset containing the parameter values and pomic scores }
  \item{colnbparameters}{ Numerical, index of columns where the parameters are found }
  \item{colnbpomic}{ Numerical, index of column where the pomic scores are found }
  \item{colnbvarparam}{ Numerical, index of columns where the variances of parameters given each model can be found (should be of same length than colnbparameters)}
  \item{order}{ Boolean, should the dataframe be ordered according to the pomic scores}  
}
\details{
  The scores of POMIC should be raw values considering only one pattern. 
  In case of multiple patterns fitting, for each model (or parameterization) the mean wPOMIC should be calculated and then  the \link{summarize.parameters} function should be used.
  The dataset of results is ordered according to POMIC scores if order=TRUE (default).
}
\value{
Return a list containing:
  \item{dataset}{ an ordered data frame containing the entered data set and the columns of delta POMIC, Likelihood of model and POMIC weights}
  \item{params}{ a data set of best parameter values, averaged parameter values and standard deviation of parameters}
}

\author{ Cyril Piou 
\cr
\email{cyril.piou@yahoo.fr}
}

\seealso{\code{\link{summarize.parameters}} \code{\link{summarize.pomics}} \code{\link{pomic}}}

\examples{
dataset<-data.frame(P1=rep(1:5,each=5),P2=rep(seq(0,5,length=5),5),pomics=runif(25)*20)
analyse.pomics(dataset,c(1,2),3)
}

\keyword{ misc }
\keyword{ utilities }
\keyword{ programming }
