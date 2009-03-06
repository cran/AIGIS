\name{ab.gstats}
\alias{ab.gstats}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Get statistics for hypothetical fires in all gridcells}

\description{
This is the primary and all-inclusive function for the gridcell statistics half of the package.  It wraps various supporting functions to return a 3-d array with x and y dimensions corresponding to the gridcells in MASK, and gives the expected value of housing structures enclosed, damaged, and value damaged for a fire of specified area in each gridcell, also providing upper and lower bounds for each of those values.  
}

\usage{
ab.gstats(area = 200, units = "ha", gridgpcobj = gridgpc, gws = gridinws, 
  strind = 1, valind = 2, recvals = bgvals, recarea = rbgarea, dr = damrats, 
  cap = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{area}{An numeric area for the fire, expressed in one of five units, specified by \code{units}.}
  \item{units}{A character object indicating the units on \code{area}, one of:
    \itemize{ 
    \item{\dQuote{ha}}{Hectares}
    \item{\dQuote{sqkm}}{Square kilometers}
    \item{\dQuote{sqmi}}{Square miles}
    \item{\dQuote{acres}}{Acres}
    \item{\dQuote{deg-area}}{Area expressed in lat-lon degree area}}
    }
  \item{gridgpcobj}{A list object containing gridcells in gpc form as well as indexing vectors.  See help for the data object \code{gridgpc} for exact form.}
  \item{gws}{Grid weights.  A list of matrices giving zone indices and overlaps for each gridcell.  For now \code{gridinws} is the appropriate companion object to \code{gridgpc}.}
  \item{strind}{An integer indicating which column of the record value matrix to use for structures, (or any variable you would like evaluated both with and without the application of the damage ratio).}
  \item{valind}{An integer indicating which column of the record value matrix to use for aggregate value (or any column you would like to have evaluated only with the damage ratio applied).}
  \item{recvals}{A matrix containing the data to be bounded, with rows corresponding to zones, and columns corresponding to different variables.}
  \item{recarea}{A vector giving the area of each polygon corresponding to the records in \code{recvals}, in units of lat-lon degree area.  Unlike for the standard areal interpolation functions built around \code{arealw}, this must be provided and cannot be set to \dQuote{none}.}
  \item{dr}{CA Wildfire specific.  A vector giving precalculated damage ratios by block group.}
  \item{cap}{Logical passed to \code{area2frac}, indicating whether or not to automatically cap the answer at one, if the area called for is greater than the area of the cell.}
}
%\details{
%  ~~ If necessary, more details than the description above ~~
%}
\value{
An array with \code{dim=c(93,97,9)}, the (currently) hardcoded size of the CA mask.  The first three layers are the expected value for housing structures, housing structures damaged, and housing value damaged.  The next three are the lower bounds, and the last three are the upper bounds on those values.  
}
%\references{ ~put references to the literature/web site here ~ }
\author{Benjamin P. Bryant, \email{bryant@prgs.edu} and Anthony Westerling, \email{awesterling@ucmerced.edu}}
\note{
Currently this function is rather inflexible.  Future versions may feature the ability to specify a more extensive combination of input values (in terms of variables to use and whether to apply damages).  For now that can be done by very simple modifications to the function, by altering the underlying calls to \code{ab.gbounds} and \code{ab.gmu}.  Alternatively you can create customized data objects by combining the output from multiple calls to this function. 
}

%\seealso{ ~~objects to See Also as \code{\link{help}}, ~~~ }
\examples{

data(bgvals)
data(damrats)
data(gridgpc)
data(gridinws)
data(MASK)
data(rbgarea)

#Do the whole shebang for California gridcells with 200 ha fire:
#(will take several minutes)
twohstats <- ab.gstats(area = 200, units = "ha", gridgpcobj = gridgpc, 
  gws = gridinws, strind = 1, valind = 2, recvals = bgvals, recarea = rbgarea,
  dr = damrats, cap = TRUE)

}
\keyword{spatial}% at least one, from doc/KEYWORDS
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
