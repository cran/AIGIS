\name{MASK}
\alias{MASK}
\docType{data}
\title{A matrix indicating whether CA gridcells do or do not have fire estimates}
\description{
A matrix whose entries correspond to 1/8 degree gridcells referenced against the (approximately) outer bounds of California. 
}
\usage{data(MASK)}
\format{
A matrix with 93 rows and 97 columns, with each entry a 0 or 1.   
}
\details{
Estimated wildfire probabilities are available for 1/8 degree gridcells in the western United States.  However, estimated data is not available for every gridcell, either because of missing data required for the model, or the gridcell comprises an regions for which wildfire is not relevant, such as an entirely urban environment or water feature (eg, the Pacific Ocean).    

Entry [1,1] corresponds to the eigth degree gridcell centered at -124.5625 longitude and 31.9375 latitude.  Entry [93,97] corresponds to the gridcell centered at -113.0625 longitude and 43.9375 latitude.  
}

%\source{
%  ~~ reference to a publication or URL from which the data were obtained ~~
%}
%\references{
%  ~~ possibly secondary sources and usages ~~
%}
\examples{
data(MASK)
image(MASK)
%## maybe str(MASK) ; plot(MASK) ...
}
\keyword{datasets}
