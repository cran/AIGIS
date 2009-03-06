\name{cabgbbmat}
\alias{cabgbbmat}
\docType{data}
\title{Matrix of bounding box data for California block groups}
\description{A 22195 by 4 matrix containing bounding box data for the US Census block group polygons contained in \sQuote{cabggpc}.  Note this is for the polygons, and not the actual block groups (see Details).  
}
\usage{data(cabgbbmat)}
\format{See description above.
}
\details{
This object used by other functions to provide a fast filter for determining which block groups need to be considered as potentially overlapping with a target polygon.  For example, if the the low edge of the bounding box is higher than the high edge of the bounding box for a target polygon, it is impossible for them to overlap.  Similarly for the other three sides.  

As mentioned elsewhere, the mapping of GIS records provided by the census is not 1 to 1 with the number of block groups.  This file is specific to the polygons provided, not the block groups.    
}
%\source{
%  ~~ reference to a publication or URL from which the data were obtained ~~
%}
\references{
The polygons from which these bounding boxes were extracted are found here:
  \url{http://www.census.gov/geo/www/cob/}
}
\examples{
data(cabgbbmat)
%## maybe str(cabgbbmat) ; plot(cabgbbmat) ...
}
\keyword{datasets}
