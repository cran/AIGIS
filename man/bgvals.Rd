\name{bgvals}
\alias{bgvals}
\docType{data}
\title{A data frame containing values of interest for CA block groups}
\description{A dataframe that contains both raw values from the original US Census summary file 3 for California, as well as two estimated values.  Data is at the block group level. Identifying info about the block group of row \sQuote{i} can be identified by referencing \code{polytobg[polytobg[,1]==i,]}.    
}
\usage{data(bgvals)}
\format{
  A data frame with 22133 observations on the following 9 variables.
  \describe{
    \item{\code{h.str}}{Estimated number of housing structures in the block group.}
    \item{\code{agg.val}}{Estimated total housing value inside the block group.}
    \item{\code{pop}}{Total population.}
    \item{\code{h.tot}}{Total number of housing units.}
    \item{\code{h.vac}}{Total number of vacant housing units.}
    \item{\code{h.occ}}{Total number of occupied housing units.}
    \item{\code{h.oo}}{Total number of owner occupied housing units.}
    \item{\code{h.ro}}{Total number of renter occupied housing units.}
    \item{\code{oo.val}}{Total reported value of owner-occupied housing units.}
  }
}
\details{
The estimated values for the column \sQuote{h.str} were calculated as follows:  Census tables provided data on number of housing units by units contained in structure.  These numbers were weighted by the inverse of units in structure to arrive at a total estimate of housing values.  The column \sQuote{agg.val} was the sum of census-provided data on owner occupied housing values, with an estimate for aggregate rental housing values.  Rental housing values were estimated by assuming equal value as owner-occupied units, normalized by housing units per structure.      
}

\source{
Census 2000 Summary File 3:
\url{http://factfinder.census.gov/servlet/DatasetMainPageServlet?_program=DEC&_submenuId=datasets_1&_lang=en}
}
%\references{
%  ~~ possibly secondary sources and usages ~~
%}
\examples{
data(bgvals)
%## maybe str(bgvals) ; plot(bgvals) ...
}
\keyword{datasets}
