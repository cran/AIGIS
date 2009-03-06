\name{gridinws}
\alias{gridinws}
\docType{data}
\title{A list of index-weight matrices for the grid and California block groups}
\description{
A list of 2871 elements corresponding to 1/8 degree gridcells in California.  Each element of the list is a matrix that contains the block group indices and weights (fraction of area overlap) for one gridcell, in form that can be input to \code{dp.interp}.  The cells themselves are stored in \code{gridgpc}. 
}
\usage{data(gridinws)}
\format{
Each element of the list is a matrix, each row of which corresponds to a block group, with the first column giving the block group identifier, and the second giving the area fraction of that block group contained inside the gridcell \code{gridgpc[[1]][[i]]}.          
}
%\details{
%  ~~ If necessary, more details than the __description__ above ~~
%}
%\source{
%  ~~ reference to a publication or URL from which the data were obtained ~~
%}
%\references{
%  ~~ possibly secondary sources and usages ~~
%}
\examples{
data(gridinws)
%## maybe str(gridinws) ; plot(gridinws) ...
}
\keyword{datasets}
