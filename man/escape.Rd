% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/escape.R
\name{escape}
\alias{escape}
\alias{escape.latexmath}
\alias{escape.character}
\alias{escape.list}
\title{Escape special character of latex math}
\usage{
escape(x)

\method{escape}{latexmath}(x)

\method{escape}{character}(x)

\method{escape}{list}(x)
}
\arguments{
\item{x, }{an object used to select a method}
}
\description{
Escape special character so that it can be safely included as latex math.
}
