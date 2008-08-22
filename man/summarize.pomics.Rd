\name{summarize.pomics}
\alias{summarize.pomics}
\title{ Analyse a series of pomic scores}
\description{
  This function calculate the POMIC differences, likelihood and weights of evidence.
}
\usage{
summarize.pomics(scores)
}
\arguments{
  \item{scores}{ Numerical, a vector of pomic scores }
}
\details{
  The scores of POMIC should be raw values considering only one pattern and corresponding each to a model (or parameterization). 
}
\value{
Return a data frame containing:
  \item{deltas}{ the differences of POMIC scores to the best one}
  \item{Liks}{ the likelihood of each model to be the best one}
  \item{wPomic}{ the weights of evidence of each model}
 }

\author{ Cyril Piou 
\cr
\email{cyril.piou@yahoo.fr}
}

\seealso{\code{\link{summarize.parameters}} \code{\link{analyse.pomics}} \code{\link{pomic}} }

\examples{
modelscores<-runif(50,100,400)
res<-cbind(models=paste("model",1:50),modelscores,summarize.pomics(modelscores))
res[order(modelscores),]
}

\keyword{ misc }
\keyword{ utilities }
\keyword{ programming }
