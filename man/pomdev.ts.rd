\name{pomdev.ts}
\alias{pomdev.ts}
\title{ POMDEV calculation for numerical time series patterns }
\description{
  This function calculate the POMDEV value of time series simulations results compared to a vector taken as a field pattern.
}
\usage{
pomdev.ts(object1, object2, eps=10^-30, nrange=1000)
}
\arguments{
\item{object1}{ Numerical, vector of the field pattern }
  \item{object2}{ Numerical, matrix of simulations results with nrow = length(object1) and ncol > 2}
  \item{eps}{ Numerical, value to use when the likelihood = 0 for mathematical stability }
  \item{nrange}{ Numerical, number of interval to consider for the probability density function creation and integration}
}
\details{
  This function is still under evaluation and should give a possibility of deviance measurement for temporal patterns. It corresponds to the sum of twice the log of approximated likelihoods given by approximating function of density from simulation results for each field data point.
}
\value{
Return a value corresponding to the pomdev score of model results to reproduce the pattern.
}

\author{ Cyril Piou 
\cr
\email{cyril.piou@yahoo.fr}
}

\seealso{\code{\link{pomdev}} \code{\link{pomdev.extra}} \code{\link{pomdev.corrected}}}

\examples{
pomdev.ts(rnorm(100,10,5),matrix(rnorm(100*5,10.5,6),ncol=5),eps=10^-20)

}

\keyword{ misc }
\keyword{ utilities }
\keyword{ programming }
