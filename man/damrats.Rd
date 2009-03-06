\name{damrats}
\alias{damrats}
\docType{data}
\title{Precomputed wildfire damage ratios for CA block groups}
\description{
Based on very approximate empirical analysis, gives the fraction of structures in a block group that would, on average, be damaged if that block group were contained in the perimeter of a wildfire.  Note this will be zero for blocks above a certain housing density.  
}
\usage{data(damrats)}
\format{
A vector of length 22133 (equal to the number of block groups).  Entry [i] corresponds to block group [i] as referenced in \sQuote{bgvals} and identified in \code{polytobg[polytobg[,1]==i,]}.  
}
\details{
The estimates were derived by linking data from the archived National Interagency Coordination Center (NICC) Incident Management Situation Reports (http://cidi.org/wildfire/) with census data for the number of homes in a polygon, with GIS data on fire perimeters for fires in the NICC archives.  They are highly uncertain, with an extremely low R squared.   
}
%\source{
%  
%}
%\references{
%}
\examples{
data(damrats)
%## maybe str(damrats) ; plot(damrats) ...
}
\keyword{datasets}
