\name{bbox.mat}
\alias{bbox.mat}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Create a matrix of bounding box data for a list of polygons}
\description{
Given a list of polygons of class gpc.poly, this creates a matrix where each row contains the bounding box data for corresponding polygon.   
}
\usage{
bbox.mat(zones = cabggpc)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{zones}{The list of polygons from which to extract bounding box information.}
}
%\details{
%  ~~ If necessary, more details than the description above ~~
%}
\value{
      A matrix of dimension \code{length(zones)} by 4.  The columns correspond to low longitude, high longitude, low latitude and high latitude respectively.
}
%\references{ ~put references to the literature/web site here ~ }
\author{Benjamin P. Bryant, \email{bryant@prgs.edu}}
%\note{ ~~further notes~~ 

% ~Make other sections like Warning with \section{Warning }{....} ~
%}
\seealso{\code{\link{arealw}}}
\examples{

data(cabgbbmat)
data(cabggpc)


moh <- bbox.mat(cabggpc)

identical(cabgbbmat, moh)
}
\keyword{spatial}% at least one, from doc/KEYWORDS
