\name{cabggpc}
\alias{cabggpc}
\docType{data}
\title{California block group polygons in gpc.poly format}
\description{A list consisting of California block group polygons, converted from Shapefile to class gpc.poly, to take advantage of the polygon intersecting capabilities offered by \code{gpclib}.
}
\usage{data(cabggpc)}
\format{
A list of length 22195, where each entry is a polygon of class \code{gpc.poly}.  
}
%\details{
%~
%}
%\source{
%  ~~ reference to a publication or URL from which the data were obtained ~~
%}
\references{
The original polygons which were converted are available here:
  \url{http://www.census.gov/geo/www/cob/}
}
\examples{
data(cabggpc)
%## maybe str(cabggpc) ; plot(cabggpc) ...
}
\keyword{datasets}
