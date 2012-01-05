\name{gc2gpc}
\alias{gc2gpc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{A function to create a rectangular polygon from a vector of bounds}
\description{
Given a vector indicating minimum and maximum latitude and longitudes, creates a rectangular polygon of class \code{gpc.poly}, which can then be used by other areal weighting functions.   This is simply a very thin wrapper for \code{as(...,'gpc.poly'}, and use primarily as a convenient internal function.  
}
\usage{
gc2gpc(bounds)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{bounds}{A vector of length four, who's entries are (in order):  Minimum longitude, maximum longitude, minimum latitude, maximum latitude.}
}

\value{
  A rectangular polygon object of class \code{gpc.poly}.
}
%\references{ ~put references to the literature/web site here ~ }
\author{Benjamin P. Bryant, \email{bryant@prgs.edu}}
%\note{ ~~fur
%
% ~Make other sections like Warning with \section{Warning }{....} ~
%}
\seealso{\code{\link{cell.arealw}}}
\examples{

poly1 <- gc2gpc(c(0,1,0,1))
poly2 <- gc2gpc(c(.3,1.1,.25,1.02))

plot(poly1)
plot(poly2,add=TRUE)
plot(intersect(poly1,poly2), poly.args=list(col="blue"),add=TRUE)



## The function is currently defined as
function(bounds){

    minglon <- bounds[1]
    maxglon <- bounds[2]
    minglat <- bounds[3]
    maxglat <- bounds[4]

     gpoly <- cbind(c(minglon, maxglon, maxglon, minglon),c(minglat, 
      minglat, maxglat, maxglat))

     gpoly <- as(gpoly, "gpc.poly")

     return(gpoly)
     
  }
}
\keyword{spatial}% at least one, from doc/KEYWORDS
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
