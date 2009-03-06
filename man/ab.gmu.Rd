\name{ab.gmu}
\alias{ab.gmu}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Find expected value for a random fires in all 1/8 degree gridcells}
\description{
For each 1/8 degree gridcell in California, estimate the expected value contained inside a fire perimeter of specified area.  Operates by finding the total value inside the gridcell and multiplying by the appropriate fraction, determined by a call to \code{area2frac}. 
}
\usage{
ab.gmu(gridgpcobj = gridgpc, gws = gridinws, afracs = gfracs, recvar = 1, 
  recvals = bgvals, appdam = FALSE, trimmedin = TRUE, dr = damrats, 
  maskobj = MASK)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{gridgpcobj}{A list object containing gridcells in gpc form as well as indexing vectors.  See help for the data object \code{gridgpc} for exact form.}
  \item{gws}{Grid weights.  A list of matrices giving zone indices and overlaps for each gridcell.  For now \code{gridinws} is the appropriate companion object to \code{gridgpc}.}
  \item{afracs}{A precalculated vector giving the fraction of land area in each gridcell occupied by a fire of a given area.}
  \item{recvar}{An integer indicating which column of the record value matrix to use. That is, what variable is to be interpolated.}
  \item{recvals}{A matrix containing the data to be interpolated, with rows corresponding to zones, and columns corresponding to different variables.}
  \item{appdam}{CA Wildfire specific.  A logical indicating whether or not to apply the empirically derived damage ratio.}
  \item{trimmedin}{Whether the overlap weights are provided in matrix form.  Must be true for this version.}
  \item{dr}{CA Wildfire specific.  A vector giving precalculated damage ratios by block group.}
  \item{maskobj}{A matrix of ones and zeros noting which gridcells should be used and which omitted}
}




\value{
Returns a matrix of with \code{nrow=nrow(MASK)} and \code{ncol=ncol(MASK)}, where entry value[i,j] corresponds to the expected value for a fire of given size in the gridcell corresponding to \code{MASK[i,j]}.
}
%\references{ ~put references to the literature/web site here ~ }
\author{Benjamin P. Bryant, \email{bryant@prgs.edu}}
%\note{ ~~further notes~~ 
%
% ~Make other sections like Warning with \section{Warning }{....} ~
%}
%\seealso{ ~~objects to See Also as \code{\link{help}}, ~~~ }
\examples{


data(bgvals)
data(damrats)
data(gridgpc)
data(gridinws)
data(MASK)

#Find expected values on houses enclosed by a 200 ha fire.
#First, create the (reusable) vector of area fractions:

gfracs <- sapply(gridgpc[[1]],area2frac, area=200,units="ha", cap=TRUE)

theresult <- ab.gmu(gridgpcobj = gridgpc, gws = gridinws, afrac = gfracs,
 appdam=FALSE, recvar = 1)

}
\keyword{spatial}% at least one, from doc/KEYWORDS
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
