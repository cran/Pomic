\name{pomdev.extra}
\alias{pomdev.extra}
\title{ POMDEV calculation for numerical patterns as well as other goodness of fit indicators }
\description{
  This function calculate the POMDEV value of simulations results compared to a vector taken as a field pattern and compute also other goodness of fit indicators.
}
\usage{
pomdev.extra(object1, object2, eps=10^-30, nrange=1000, fullmsd=FALSE,  plotting=FALSE,...)
}
\arguments{
\item{object1}{ Numerical, vector of the field pattern }
  \item{object2}{ Numerical, vector of simulations results }
  \item{eps}{ Numerical, value to use when the likelihood = 0 for mathematical stability }
  \item{nrange}{ Numerical, number of interval to consider for the probability density function creation and integration}
  \item{fullmsd}{ Boolean, should the full cross MSD be calculated as well}
  \item{plotting}{ Boolean, should a plot illustrating the calculation be created}
  \item{\dots}{ eventual information to give to the last plot (if plotting=T)...  }
}
\details{
  The KL divergence is only calculated comparing the simulations to the field vector, as if it is the truth (different from the \pkg{flexmix} KLdiv calculations)
}
\value{
Return a list containing:
  \item{field_data}{ the field data }
  \item{sim_data}{ the simulation data}
  \item{kernel_estimator}{ information about the kernel estimator used}
  \item{result}{ a table of 4 or 5 rows (depending if fullmsd=TRUE or not) with:}
    \item{-  POMDEV}{ pomdev score of model results to reproduce the pattern}
    \item{-  overlap}{ indicates if the model results overlap the range of the field data}
    \item{-  KLdiv}{ KL divergence of the model results from the field pattern}
    \item{-  MSD }{ \eqn{(\sum(field)/n_{field}-\sum(simulation)/n_{simulation})^2}}
    \item{-  CrossMSD}{ if fullmsd is true, calculate the mean square deviation among each pair of simulation and field data possible}

}

\author{ Cyril Piou 
\cr
\email{cyril.piou@yahoo.fr}
}

\seealso{\code{\link{pomdev}} \code{\link{pomdev.corrected}}}

\examples{
pomdev.extra(rnorm(100,10,5),rnorm(100*5,10.5,6),eps=10^-20)
pomdev.extra(rnorm(100,10,5),rnorm(100*5,10.5,6),eps=10^-20,fullmsd=TRUE,plotting=TRUE)
}

\keyword{ misc }
\keyword{ utilities }
\keyword{ programming }
