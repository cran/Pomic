\name{pomdev}
\alias{pomdev}
\title{ POMDEV calculation for numerical patterns }
\description{
  This function calculate the POMDEV value of simulations results compared to a vector taken as a field pattern.
}
\usage{
pomdev(object1, object2, eps=10^-30, nrange=1000)
}
\arguments{
\item{object1}{ Numerical, vector of the field pattern }
  \item{object2}{ Numerical, vector of simulations results }
  \item{eps}{ Numerical, value to use when the likelihood = 0 for mathematical stability }
  \item{nrange}{ Numerical, number of interval to consider for the probability density function creation and integration}
}
\details{
  This function returns the POMDEV value as computed in Piou et al. It corresponds to twice the sum of the log of an approximated likelihood given by the approximating function of density from the simulation results applied on the field data.
}
\value{
Return a value corresponding to the pomdev score of model results to reproduce the pattern.
}

\author{ Cyril Piou 
\cr
\email{cyril.piou@yahoo.fr}
}

\seealso{\code{\link{pomdev.extra}} \code{\link{pomdev.corrected}}}

\examples{
pomdev(rnorm(100,10,5),rnorm(100*5,10.5,6),eps=10^-20)

}

\keyword{ misc }
\keyword{ utilities }
\keyword{ programming }
