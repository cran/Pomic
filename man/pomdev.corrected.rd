\name{pomdev.corrected}
\alias{pomdev.corrected}
\title{ POMDEV corrected calculation for numerical patterns }
\description{
  This function calculate the KL divergence of simulations results compared to a vector taken as a field pattern with identical techniques as POMDEV.
}
\usage{
pomdev.corrected(object1, object2, eps=10^-30, nrange=1000)
}
\arguments{
\item{object1}{ Numerical, vector of the field pattern }
  \item{object2}{ Numerical, vector of simulations results }
  \item{eps}{ Numerical, value to use when the likelihood = 0 for mathematical stability }
  \item{nrange}{ Numerical, number of interval to consider for the probability density function creation and integration}
}
\details{
  This function returns 1/2 the POMDEV value + correction of the constant in KL equation corresponding to the entropy of the field pattern.
  Thus, this value should be close to the KL divergence using the same techniques of approximation than pomdev.
}
\value{
Return a value corresponding to the KL divergence between the model results and the pattern
}

\author{ Cyril Piou 
\cr
\email{cyril.piou@cirad.fr}
}

\seealso{\code{\link{pomdev.extra}} \code{\link{pomdev}}}

\examples{
pomdev.corrected(rnorm(100,10,5),rnorm(100*5,10.5,6),eps=10^-20)

}

\keyword{ misc }
\keyword{ utilities }
\keyword{ programming }
