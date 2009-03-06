\name{AIGIS-package}
\alias{AIGIS-package}
\alias{AIGIS}
\docType{package}
\title{
Areal interpolation for GIS data
}
\description{AIGIS can be used to interpolate spatially associated data onto arbitrary target polygons which lack such data.  Version 1.0 of the package is oriented toward convenient interpolation of specific US census data for California, but the tools provided should work for any combination of GIS data source and target polygon, provided appropriate care is taken.  Future versions will be aimed at facilitating more general applications.
}
\details{
\tabular{ll}{
Package: \tab AIGIS\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2009-03-06\cr
License: \tab GPL-3 \cr
}
AIGIS was originally built for specific research on estimating losses associated with wildfires in California.  The current state of the package very much reflects this, with most functions built around supporting the task of the researchers.  This is of immediate use for the author and colleagues, and for those who may wish to verify, expand or explore the work descibed in the publication cited below.  However, the tools provided by the package are generally applicable, provided the user has their own spatially associated dataset and target polygons.  Below we give an overview of general interest tasks the package can accomplish, with reference to relevant commands.  

Task 1:  For polygon A and a list of polygons B, find what fraction of each polygon in B is contained inside A.  This can be accomplished with the command \code{arealw}.  Polygon A can also be specified by simply providing a bounding box, rather than a polygon, in which case \code{cell.arealw} may be used.  

Task 2:  Task 1, but applied to a collection of polygons A.  This can be accomplished with \code{mult.arealw}.

Task 3:  Given single or multiple \sQuote{target} polygons A, and spatially associated data for polygons B, estimate the quantities associated with polygons A based on the relative contributions from polygons B.  This can be accomplished via an iterated applications of the \code{arealw} or \code{mult.arealw}, followed by \code{dp.interp}.  Alternatively, this can be done with one function call to \code{sab.areal.interp} or \code{ab.areal.interp} (for single and multiple polygons respectively).  

The package also contains specialized functions and data relevant to aggregating and bounding estimates for wildfire in 1/8 degree gridcells covering california.  These are found mainly in \code{ab.gstats}.  Use \code{ab.gmu} if not interested in bounding estimates.  

}
\author{
Benjamin P. Bryant, \email{bryant@prgs.edu} and Anthony L. Westerling \email{awesterling@ucmerced.edu}

Maintainer: Benjamin Bryant
}
\references{
Westerling, A. L. and B. P. Bryant, 2008. Climate Change and Wildfire in California. Climatic Change, 87: s231-249.

For general overview of areal interpolation and terminology, see
Sadahiro, Y.  Accuracy of areal interpolation: A comparison of alternative methods. Journal of Geographical Systems 1(4): 323-346 (1999). 
}
%~~ Literature or other references for background information ~~

\keyword{ package }
% ~~ Optionally other keywords from doc/KEYWORDS, one per line
% \seealso{
%~~ Optional links to other man pages, e.g. ~~
%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
%}
\examples{
#See the details section above for noteworthy commands.  Their helpfiles 
#should contain illuminating example scripts.
}
