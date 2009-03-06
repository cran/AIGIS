\name{ab.gcbounds}
\alias{ab.gcbounds}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Calculate the bounds on values contained in a random fire perimeter of given area}
\description{
Given an 1/8 degree gridcell and an area representing the area contained inside a hypothetical fire perimeter, calculate the upper and lower bounds on values that could be contained inside that perimeter. Assumes the fire occupied the highest and lowest density block groups respectively, and (at present) does not enforce contiguity requirements.
}
\usage{
ab.gcbounds(iwtmat, area = 0.125^2, recarea = rbgarea, recvar = 1, 
  recvals = bgvals, appdam = FALSE, dr = damrats)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{iwtmat}{Index Weight Matrix.  A two column matrix of zone indices and weights such as that output by a call \code{arealw(target=thegridcell, zones=theappropriatezones, trimout=TRUE)}.  More likely it will be an element of data object \code{gws}, which contains precalculated matrices for 1/8 degree gridcells as targets and the California block groups as the zones.}
  \item{area}{The area of the hypothetical fire, expressed in lat/lon degrees area.}
  \item{recarea}{A vector of zone areas, ordered by their index in a matrix of \code{recvals}.}
  \item{recvar}{An integer indicating which column of the record value matrix to use.}
  \item{recvals}{A matrix of record values containing the data to be bounded.} 
  \item{appdam}{CA Wildfire specific.  A logical indicating whether or not to apply the empirically derived damage ratio.}
   \item{dr}{CA Wildfire specific.  A vector giving precalculated damage ratios by block group.  Only used if \code{appdam=TRUE.}}
}
\details{
The bounds are calculated in an extremely conservative way (similar to, but distinct from the method used by \code{dp.interp}.  In both cases, it orders block groups by density, and adds block group values in increasing or decreasing density order (for lower and upper bounds respectively) until the total area is reached.  Furthermore, for the lower bound it is assumed that all zones crossing the target border have density zero (i.e., that their entire value is contained outside the cell).  For the upper bound, it is assumed that all zones crossing the border have their entire value within the cell.    
}
\value{
A vector of length two with a lower bound and an upper bound on possible values for a fire contained inside the grid. 
}
%\references{ ~put references to the literature/web site here ~ }
\author{Benjamin P. Bryant, \email{bryant@prgs.edu}}
%\note{ ~~further notes~~ 
%
% ~Make other sections like Warning with \section{Warning }{....} ~
%}
%\seealso{ ~~objects to See Also as \code{\link{help}}, ~~~ }
\examples{

data(bgvals)
data(damrats)
data(gridgpc)
data(gridinws)
data(rbgarea)

#What are the bounds on a 200 ha fire near San Diego?
#First tranlate 200 ha into lat-lon degree^2:
thearea <- .125^2*area2frac(cell=gridgpc[[1]][[2139]], area=200, units="ha", 
  naive=TRUE)

ab.gcbounds(iwtmat=gridinws[[2139]], area=thearea)

}
\keyword{spatial}% at least one, from doc/KEYWORDS
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
