\name{ab.gbounds}
\alias{ab.gbounds}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Calculate bounds on hypothetical fires in CA 1/8 degree gridcells}
\description{
Calculate the upper and lower bounds on values that could be contained inside fire perimeters of arbitrary area in every single 1/8 degree gridcell in California. Assumes the fire occupied the highest and lowest density block groups respectively, and does (at present) not enforce contiguity requirements.  Also, at present this function is not generalizable beyond the CA wildfire problem, and \code{area}, \code{units}, \code{recvar} and \code{appdam} are the only arguments that can be safely changed from the default.  
}
\usage{
ab.gbounds(gridgpcobj = gridgpc, gws = gridinws, area = 200, units = "ha", 
  recvar = 1,  recvals = bgvals, recarea = rbgarea, appdam = TRUE, 
  dr = damrats, cap = TRUE, maskobj=MASK)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{gridgpcobj}{A list object containing gridcells in gpc form as well as indexing vectors.  See help for the data object \code{gridgpc} for exact form.}
  \item{gws}{Grid weights.  A list of matrices giving zone indices and overlaps for each gridcell.  For now \code{gridinws} is the appropriate companion object to \code{gridgpc}.}
 \item{area}{An numeric area expressed in one of five units, specified by \code{units}.}
  \item{units}{A character object indicating the units on \code{area}, one of:
    \itemize{ 
    \item{\dQuote{ha}}{Hectares}
    \item{\dQuote{sqkm}}{Square kilometers}
    \item{\dQuote{sqmi}}{Square miles}
    \item{\dQuote{acres}}{Acres}
    \item{\dQuote{deg-area}}{Area expressed in lat-lon degree area}
    }
  }
  \item{recvar}{An integer indicating which column of the record value matrix to use. That is, what variable is to be bounded.}
  \item{recvals}{A matrix containing the data to be bounded, with rows corresponding to zones, and columns corresponding to different variables.}
  \item{recarea}{A vector giving the area of each polygon corresponding to the records in \code{recvals}, in units of lat-lon degree area.  Unlike for the standard areal interpolation functions built around \code{arealw}, this must be provided and cannot be set to \dQuote{none}.}
  \item{appdam}{CA Wildfire specific.  A logical indicating whether or not to apply the empirically derived damage ratio.}
  \item{dr}{CA Wildfire specific.  A vector giving precalculated damage ratios by block group.}
  \item{cap}{Logical passed to \code{area2frac}, indicating whether or not to automatically cap the answer at one, if the area called for is greater than the area of the cell.}
  \item{maskobj}{A matrix of ones and zeros noting which gridcells should be used and which omitted}
}
\details{
This is primarily a midlevel wrapper, which loops calls to \code{ab.gcbounds}.  It itself is wrapped by \code{ab.gstats}, which uses its output in assembling the final array reporting expected values, and bounds for housing structures, housing structures damaged, and total property value damaged. 
}
\value{
Returns an array with dimensions \code{dim=nrow(MASK),ncol(MASK),2)}, where the value[i,j,] is a length two vector whose first entry is the lower bound estimate for the gridcell identified by MASK[i,j], and whose second entry is the upper bound estimate.
}
\author{Benjamin P. Bryant, \email{bryant@prgs.edu}}
\note{If enough area within a gridcell is overlapping the border, the results will always be zero for the lower bound - thus fire sizes need to become reasonable large before the lower bound will be nonzero anywhere.  
}
\seealso{\code{\link{ab.gcbounds}}}
\examples{


data(bgvals)
data(damrats)
data(gridgpc)
data(gridinws)
data(MASK)
data(rbgarea)


#find upper and lower bounds of housing value threatened by 200 ha fires in all
#gridcells.  (Will take a minute or two of calculating time.)

somebounds <- ab.gbounds(gridgpcobj = gridgpc, gws = gridinws, area = 200, 
  units = "ha", recvar = 2,  recvals = bgvals, recarea = rbgarea, 
  appdam = FALSE, dr = damrats, cap = TRUE)

}
\keyword{spatial}% at least one, from doc/KEYWORDS
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
