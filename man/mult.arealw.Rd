\name{mult.arealw}
\alias{mult.arealw}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Areal weights for multiple target polygons}
\description{
 Essentially a wrapper for \code{arealw}, allowing the user to retrieve areal weights for multiple target polygons over the same list of zonal polygons.  Permits calculations for all elements of a list of target polygons, or a those specified by vector indexing elements in that list.  Depending on the calling options, returns the result as a list or matrix.  
}
\usage{
mult.arealw(target.ind = "all", targetlist = firepgpc, trimout = TRUE, 
  zones = cabggpc, zbbmat = cabgbbmat, zoneareas = rbgarea, twokcensus = TRUE,
  digits = 6, verbose = 2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{target.ind}{A vector containing list indices of target polygons, or character \dQuote{all}, which indicates the entire list is to be used.}
  \item{targetlist}{A list of possible target polygons}
  \item{trimout}{Logical indicating output format. See \code{Value} for details.}
  \item{zones}{List of zonal polygons for which fractional overlap is to be determined.}
  \item{zbbmat}{\dQuote{Zonal bounding box matrix.} Either a matrix of dimension \code{length(zones)} by 4, or character \dQuote{none}.  If \dQuote{none,} an appropriate matrix is automatically computed by a call to \code{bbox.mat}.  See \sQuote{Details.}}
  \item{zoneareas}{A vector giving the area of each zone or character \dQuote{none}, indicating they must be calculated inside the function.}
  \item{twokcensus}{Logical indicating whether the data in question is block group level data for California from the 2000 US Census. If \sQuote{TRUE}, the function automatically handles certain ideosyncracies associated with that data.}
  \item{digits}{Digits argument passed to \code{round} internally.  Used in setting the tolerance for considering fractional overlap to be 100 percent.  Due to numerical issues, overlap will not always be identically 1 even when a zone is contained entirely within the target.  There should be little reason to modify this away from the default value of six.}
  \item{verbose}{An integer indicating how frequently to print progress through the target polygons.  Will print a message every time 10 to the \code{verbose} target polygons have been processed.   Setting verbose negative results in no progress output.}
}
\details{If not \dQuote{none}, \sQuote{zbbmat} must take the form of a \code{length(zones)} by 4 matrix, where each row corresponds to the bounding latitude and longitude values for polygons in \sQuote{zones}, the same format returned by the function \code{\link{bbox.mat}}.  The columns correspond to low longitude, high longitude, low latitude and high latitude respectively.
}
\value{If trimout equals 'FALSE', the function returns a matrix with number of rows equal to the number of zones, and columns equal to the number of target polygons specified by \sQuote{target.ind}.   Entry [i,j] then corresponds to the fractional overlap for of zone i in target polygon j.  Since a large number of entries are likely to be zero, this is a wasteful storage method, but may be valuable as a convenient format with which to perform certain manual operations on the data.  

Setting trimout equal to 'TRUE' returns a list of length equal to \code{length(target.ind)}.  Each element of the list is an \sQuote{n} by 2 matrix, where \sQuote{n} is the number of zones with nonzero overlap for that the target polygon associated with that list element.  The first column contains the indices for those zones with overlap, and the second column contains the actual overlap weights.

Whatever object returned also has the \sQuote{call} attribute, allowing one to identify target polygons by their original index in the original unsubsetted polygon list. 
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

#Get two areal weights independently using arealw:

fire1 <- arealw(fpdemogpc[[1]],trimout=TRUE)
fire3 <- arealw(fpdemogpc[[3]],trimout=TRUE)

#Stick them together and see if they match the output of mult.arealw, which 
#does them at the same time:

stucktogether <- list(fire1,fire3)

both <- mult.arealw(target.ind=c(1,3), targetlist = fpdemogpc, trimout=TRUE)

attributes(stucktogether) <- NULL
attributes(both) <- NULL

#should be true:
identical(both, stucktogether)

}
\keyword{spatial}% at least one, from doc/KEYWORDS
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
