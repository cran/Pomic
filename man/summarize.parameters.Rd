\name{summarize.parameters}
\alias{summarize.parameters}
\title{ Analyse a data frame with parameter values and pomic weights to give the averaged parameters}
\description{
  This function do parameter averaging.
}
\usage{
summarize.parameters(dataset,colnbparameters,colnbweight,colnbvarparam=NULL)
}
\arguments{
  \item{dataset}{ Numerical, a dataset containing the parameter values and pomic weights }
  \item{colnbparameters}{ Numerical, index of columns where the parameters are found }
  \item{colnbweight}{ Numerical, index of column where the pomic weights are found }
  \item{colnbvarparam}{ Numerical, index of columns where the variances of parameters given each model can be found (should be of same length than colnbparameters)}
}
\details{
    The pomic weights should sum up to 1.
}
\value{
Return a data set of best parameter values, averaged parameter values and standard deviation of parameters
}

\author{ Cyril Piou
\cr
\email{cyril.piou@forst.tu-dresden.de}
}

\seealso{\code{\link{analyse.pomics}} \code{\link{pomic}}}

\examples{
dataset<-data.frame(P1=rep(1:5,each=5),P2=rep(seq(0,5,length=5),5)
                    ,wPomics=(1:25)/sum(1:25))
summarize.parameters(dataset,c(1,2),3)
}

\keyword{ misc }
\keyword{ utilities }
\keyword{ programming }
