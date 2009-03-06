\name{polytobg}
\alias{polytobg}
\docType{data}
\title{Link CA block group polygons to block group data records}
\description{Each row corresponds to a block group polygon, and contains information to identify the corresponding block group, by index in \code{\link{bgvals}} as well as Logical Record Number, County ID, Block, and Group number.
}
\usage{data(polytobg)}
\format{
  A data frame with 22195 observations on the following 5 variables.
  \describe{
    \item{\code{bg-index}}{The index in \code{\link{bgvals}} of the corresponding block group}
    \item{\code{LRN}}{The logical record number - a unique identifier from the summary file 3}
    \item{\code{county}}{A numeric county identifier}
    \item{\code{block}}{The block number}
    \item{\code{group}}{The group number within the block}
  }
}
%\details{
%  ~~ If necessary, more details than the __description__ above ~~
%}
%\source{
%
%}
\references{
US Census Summary File 3 Documentation
\url{http://www.census.gov/prod/cen2000/doc/sf3.pdf}
}
\examples{
data(polytobg)
%## maybe str(polytobg) ; plot(polytobg) ...
}
\keyword{datasets}
