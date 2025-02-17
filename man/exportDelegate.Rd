% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataset.R
\name{exportDelegate}
\alias{exportDelegate}
\title{Export delegate method. This method is common to RxODE and mrgsolve.}
\usage{
exportDelegate(object, dest, seed, nocb, ...)
}
\arguments{
\item{object}{current dataset}

\item{dest}{destination engine}

\item{seed}{seed value}

\item{nocb}{nocb value, logical value}

\item{...}{extra arguments}
}
\value{
2-dimensional dataset, same for RxODE and mrgsolve
}
\description{
Export delegate method. This method is common to RxODE and mrgsolve.
}
\keyword{internal}
