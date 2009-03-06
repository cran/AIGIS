\name{gridgpc}
\alias{gridgpc}
\docType{data}
\title{Gridcells for California in polygon form, with indexing for climate mask}
\description{
A list of three elements, containing a list of gpc.polys, and two indexing vectors.   
}
\usage{data(gridinws)}
\format{
The first component is itself a list.  Each element of that inner list is a gpc.poly corresponding to an 1/8 degree gridcell in California.  For storage efficiency, these were extracted from a longer list containing gridcells spanning the entire bounding box for California. 

To allow reprojection onto the same reference grid used by \sQuote{MASK}, the original indices from that longer list are retained as a vector comprising the second component of \code{gridgpc}.  That is, gridgpc[[2]][i] gives the original index of polygon gridgpc[[1]][[i]] in the list of gridcells covering the entire california block group. By applying the appropriate formula (given elsewhere), this index can then be converted back to the i,j coordinates of the \sQuote{MASK} object.      

Lastly, to avoid needlessly generating data for gridcells that are masked out, the third component indexes only those gridcells that are not masked out by \code{MASK}.  Thus, a for loop through the elements of gridgpc[[3]] will reach all non-masked gridcell in California.    
   
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
data(gridgpc)
%## maybe str(gridinws) ; plot(gridinws) ...
}
\keyword{datasets}
