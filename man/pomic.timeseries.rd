\name{pomic.timeseries}
\alias{pomic.timeseries}
\title{ Pomic calculation for numerical patterns supposing an autocorrelation (e.g. time series) }
\description{
  This function calculate a serie of POMIC values of simulations results compared to a time serie taken as field pattern. The POMIC values are computed for group of observations within a running window, eventually for differences among following values and for the whole data.
}
\usage{
pomic.timeseries(object1, object2, eps=10^-30, nrange=1000,
		fullmsd=FALSE,  plotting=FALSE, timevector=NULL, 
    half_window_size=5,check_whole=TRUE,check_diffs=FALSE,...)
}
\arguments{
  \item{object1}{ Numerical, vector of the field pattern }
  \item{object2}{ Numerical, matrix of simulations results (columns are replicates)}
  \item{eps}{ Numerical, value to use when the likelihood = 0 for mathematical stability }
  \item{nrange}{ Numerical, number of interval to consider for the probability density function creation and integration}
  \item{fullmsd}{ Boolean, should the full cross MSD be calculated as well (here taken as relative to field serie mean value)}
  \item{plotting}{ Boolean, should a plot illustrating the calculation be created}
  \item{timevector}{ Numerical, time of the serie (for plotting purpose only, no handling so far of differences of dt)}
  \item{half_window_size}{ Numerical, number of points to take around each point of the time serie to create an independent "pattern" checked with the pomic.corrected function}
  \item{check_whole}{ Boolean, should the pomic.corrected value be also computed for the entire dataset (disregarding autocorrelation)}
  \item{check_diffs}{ Boolean, should the pomic.corrected value be also computed for the differences of values between t and t+1}
  \item{\dots}{ eventual information to give to the last plot (if plotting=T) ...  }
}
\details{
  The KL divergence is not calculated. This function was thought of to look at temporal patterns, but could also be applied to spatially autocorrelated variables (e.g. Ripley's K-function). If object1 and object2 are given as time series (class), the function works normally only if they have equal times. The plotting will use then the time defined in those time series objects.
}
\value{
Return a list containing:
  \item{field_data}{ the field data }
  \item{sim_data}{ the simulation data}

  \item{simpleresult}{ a table of 3 rows with:}
    \item{-  SumPOMICs}{ the sum of POMIC scores}
    \item{-  Sum_nb_points}{ sum of nb of points analyzed in each window}
    \item{-  MSD_relative}{ a relative MSD of the entire series}
 
  \item{result}{ a table of 2 rows and several columns (corresponding to the time the data were subset) with:}
    \item{-  POMIC}{ POMIC values per subset dataset}
    \item{-  nb_points}{ number of points analyzed with the \link{pomic.simple} function in the corresponding subset}
}

\author{ Cyril Piou 
\cr
\email{cyril.piou@forst.tu-dresden.de}
}

\seealso{\code{\link{pomic.simple}} \code{\link{pomic}}}

\examples{
timeserie<-runif(100)+1:100-(seq(1,10,length=100)^2)
model<-NULL
for(i in 1:100){  
  model<-cbind(model,runif(100)+1:100-(seq(1,10,length=100)^2.01)) 
}
pomic.timeseries(timeserie,model,eps=10^-20,fullmsd=TRUE,
                  plotting=TRUE,half_window_size=10,
                  check_whole=TRUE,check_diffs=TRUE)

}

\keyword{ misc }
\keyword{ utilities }
\keyword{ programming }
