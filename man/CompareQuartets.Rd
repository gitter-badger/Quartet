% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dist_funcs.R
\name{CompareQuartets}
\alias{CompareQuartets}
\title{Compare Quartets
Compare tetrad states between trees}
\usage{
CompareQuartets(x, cf)
}
\arguments{
\item{x}{A list of tetrad states, perhaps generated in
\code{\link{CompareQuartets}}.}

\item{cf}{a second such list.

Compares each tetrad in a list, calculating how many statements are identical
 in both lists.}
}
\value{
{
  Returns an array of two elements:
  1: the number of quartets that are present in both trees
  2: the number of quartets that are not resolved in both trees
  The number of quartets that are present in one tree and contradicted in the
  other can be calcluated by deducting the total from the total number of 
  quartets, \code{choose(n_tip, 4)}.
}
}
\description{
Compares two lists of quartet states, detailing how many are identical and 
 how many are unresolved.
}
\examples{
{
  n_tip <- 6
  trees <- list(ape::rtree(n_tip, tip.label=seq_len(n_tip), br=NULL),
                ape::rtree(n_tip, tip.label=seq_len(n_tip), br=NULL))
  splits <- lapply(trees, Tree2Splits)
  quartets <- QuartetStates(splits)
  compare_result <- CompareQuartets(quartets[[1]], quartets[[2]])
  dissimilar_quartets <- choose(n_tip, 4) - sum(compare_result)  
  result <- c(compare_result, dissimilar_quartets)
  names(result) <- c('Shared', 'Unresolved', 'Dissimilar')
  result
}
}
\seealso{
\code{\link{MatchingQuartets}}, generates this output from a list of
 trees.
}
\author{
Martin R. Smith
}