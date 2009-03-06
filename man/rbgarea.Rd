
\name{rbgarea}
\alias{rbgarea}
\docType{data}
\title{California census block group areas}
\description{
 A vector of areas for California block groups, given in lat/lon degree-area, and thus latitude specific.  Primarily for internal function use.    
}
\usage{data(rbgarea)}
\format{
A vector of length 22133, with each entry corresponding to those in \code{bgvals}. 
}
%\details{
%  ~~ If necessary, more details than the __description__ above ~~
%}
\source{
For census block groups containing only one GIS record, this value is direct.  For census block groups corresponding to multiple GIS records, this value is the sum of individual GIS record values.  
}
%\references{
%  ~~ possibly secondary sources and usages ~~
%}
\examples{
data(rbgarea)
%## maybe str(rbgarea) ; plot(rbgarea) ...
}
\keyword{datasets}
