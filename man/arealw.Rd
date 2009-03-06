\name{arealw}
\alias{arealw}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Calculate areal weights for a single target polygon}
\description{
 Given an arbitrary target polygon and a list of zonal polygons, this function finds the fraction of each zonal polygon that lies inside the target polygon.  The weights can then be used by other functions to interpolate zonal vales to the target polygon.  All polygons must be of class \code{gpc.poly}.
}
\usage{
arealw(target, trimout = TRUE, zones = cabggpc, zbbmat = cabgbbmat, 
  zoneareas = rbgarea, twokcensus = TRUE, digits = 6, polytobgobj=polytobg)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{target}{An arbitrary polygon to which values will (presumably) be interpolated.}
  \item{trimout}{Logical indicating output format. See \code{Value} for details.}
  \item{zones}{List of zonal polygons for which fractional overlap is to be determined.}
  \item{zbbmat}{\dQuote{Zonal bounding box matrix.} Either a matrix of dimension \code{length(zones)} by 4, or character \dQuote{none}.  If \dQuote{none,} an appropriate matrix is automatically computed by a call to \code{bbox.mat}.  See \sQuote{Details.}}
  \item{zoneareas}{A vector giving the area of each zone, or character \dQuote{none}, indicating they must be calculated inside the function.}
  \item{twokcensus}{Logical indicating whether the data in question is block group level data for California from the 2000 US Census. If \sQuote{TRUE}, the function automatically handles certain ideosyncracies associated with that data.}
  \item{digits}{Digits argument passed to \code{round} internally.  Used in setting the tolerance for considering fractional overlap to be 100 percent.  Due to numerical issues, overlap will not always be identically 1 even when a zone is contained entirely within the target.  There should be little reason to modify this away from the default value of six.}
  \item{polytobgobj}{A link between polygon indices and block group row indices.}
}
\details{If not \dQuote{none}, \sQuote{zbbmat} must take the form of a \code{length(zones)} by 4 matrix, where each row corresponds to the bounding latitude and longitude values for polygons in \sQuote{zones}, the same format returned by the function \code{\link{bbox.mat}}.  The columns correspond to low longitude, high longitude, low latitude and high latitude respectively.
}
\value{If trimout equals 'FALSE', the function returns a vector with length equal to the number of zones, and each entry corresponding to the fractional overlap for that zone.  Since a large number of entries are likely to be zero, this is a wasteful storage method, but may be valuable as a convenient format with which to perform certain manual operations on the data.  

Setting trimout equal to 'TRUE' returns an \sQuote{n} by 2 matrix, where \sQuote{n} is the number of zones with nonzero overlap.  The first column contains the indices fo those zones, and the second column contains the actual overlap weights.
}

\references{For general overview of areal interpolation and terminology, see
Sadahiro, Y.  Accuracy of areal interpolation: A comparison of alternative methods. Journal of Geographical Systems 1(4): 323-346 (1999).}

\author{Benjamin P. Bryant, \email{bryant@prgs.edu}}

\note{The US Census 2000 data for California contains a mismatch between the number of block groups and the number of block group polygons.  The code handles this provided \code{twokcensus} is set to 'TRUE', but for all other datasets it as assumed that the number of datarecords is equal two the number of zones, and that the indexes match as well.  If not, one or the other needs to be sorted appropriately.  
}
\seealso{\code{\link{mult.arealw}}}
\examples{

data(cabgbbmat)
data(cabggpc)
data(fpdemogpc)
data(rbgarea)
data(polytobg)

#run arealw on the Cedar fire using CA block groups with trimmed output:
moh <- arealw(fpdemogpc[[3]],trimout=TRUE)

#run it with long output:
mohbig <- arealw(fpdemogpc[[3]],trimout=FALSE)

#reconstruct the untrimmed output from the trimmed output:
mohmadebig <- rep(0,length(mohbig))
mohmadebig[moh[,1]] <- moh[,2]

#should be true:
identical(mohbig, mohmadebig)

}
\keyword{spatial}% at least one, from doc/KEYWORDS
