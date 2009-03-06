\name{area2frac}
\alias{area2frac}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Find the fraction of a rectangular polygon taken up by a given area}
\description{
  Converts an area value into a fraction of gridcell coverage for use in creating random fire-within-gridcell statistics.  Allows area to be given in several possible units.  The cell can be something other than a rectangular polygon provided it is of class \code{gpc.poly}, but if so the fraction will be slightly (likely insignificantly) off, as the centroid will be incorrectly calculated.  Also allows rectangle to be specified by vector of bounds rather than a \code{gpc.poly}.    
}
\usage{
area2frac(cell, area=200, units="ha", cap=TRUE, naive=TRUE, zones = cabggpc,
 zbbmat = cabgbbmat, twokcensus=TRUE, polytobgobj=polytobg)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{cell}{A (probably rectangular) polygon of class \code{gpc.poly} or a vector of bounds ordered as min long, max long, min lat, max lat.  Units must be in degrees latitude and longitude.}
  \item{area}{An numeric area expressed in one of five units, specified by \code{units}.}
  \item{units}{A character object, one of: 
  \itemize{
    \item{\dQuote{ha}}{Hectares}
    \item{\dQuote{sqkm}}{Square kilometers}
    \item{\dQuote{sqmi}}{Square miles}
    \item{\dQuote{acres}}{acres}
    \item{\dQuote{deg-area}}{Area expressed in lat-lon degree area}}
    }
  \item{cap}{Logical indicating whether or not to automatically cap the answer at one, if the area called for is greater than the area of the cell.}
  \item{naive}{Whether or not to assume the entire area occupied by the cell should be considered in the denominator.  If you are interested in land area only, and the cell contains water, the resulting area fraction will be deflated.  If you know this is not the case, the naive option is computationally much faster, and none of the remaining arguments are used.}    
  \item{zones}{A list of polygons covering the real land area to be counted, if \code{naive}=\code{FALSE}.}
  \item{zbbmat}{\dQuote{Zonal bounding box matrix.} Either a matrix of dimension \code{length(zones)} by 4, or character \dQuote{none}.  If \dQuote{none,} an appropriate matrix is automatically computed by a call to \code{bbox.mat}.  See \sQuote{Details.}}
  \item{twokcensus}{Logical indicating whether the data in question is block group level data for California from the 2000 US Census. If \sQuote{TRUE}, the function automatically handles certain ideosyncracies associated with that data.}
  \item{polytobgobj}{A link between polygon indices and block group row indices.}
}

\details{If not \dQuote{none}, \sQuote{zbbmat} must take the form of a \code{length(zones)} by 4 matrix, where each row corresponds to the bounding latitude and longitude values for polygons in \sQuote{zones}, the same format returned by the function \code{\link{bbox.mat}}.  The columns correspond to low longitude, high longitude, low latitude and high latitude respectively.
}

\value{
  A numeric value indicating the fraction of the rectangular cell taken up by a shape with the designated area.  
}
%\references{ ~put references to the literature/web site here ~ }
\author{Benjamin P. Bryant, \email{bryant@prgs.edu}}
\note{The primary use of this function is accounting for area expressed in degrees being dependent on latitude.  It is useless if the coordinates are not expressed in degrees latitude.}
%\seealso{\code{\link{help}}, ~~~ }
\examples{

#how much of an 1/8 degree cell does a 200 ha fire occupy, 
#at a San Diego latitude:

data(cabgbbmat)
data(cabggpc)
data(polytobg)

area2frac(cell= c(-117.625,-117.5,33.375,33.5), naive=TRUE)

#what if we account for the fact that part of the cell covers the ocean:
thecell <- gc2gpc(c(-117.625,-117.5,33.375,33.5))

area2frac(cell=thecell,naive=FALSE)

}
\keyword{spatial}% at least one, from doc/KEYWORDS
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
