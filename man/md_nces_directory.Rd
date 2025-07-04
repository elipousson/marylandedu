% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{md_nces_directory}
\alias{md_nces_directory}
\title{Maryland NCES Directory (SY 2003-2024)}
\format{
A data frame with 31,579 rows and 14 variables:
\describe{
\item{\code{year}}{School year}
\item{\code{school_number}}{School number}
\item{\code{school_name}}{School name}
\item{\code{school_type}}{School type}
\item{\code{address}}{School address}
\item{\code{city}}{City}
\item{\code{state}}{State}
\item{\code{zip}}{Zip code}
\item{\code{phone}}{School phone number}
\item{\code{nces_number}}{NCES Number}
\item{\code{create_date}}{Record creation date}
\item{\code{grade_span}}{Grade span (grade band)}
\item{\code{lss_name}}{LSS name}
\item{\code{lss_number}}{LSS number}
}
}
\source{
\href{https://reportcard.msde.maryland.gov/Graphs/#/DataDownloads/datadownload}{MSDE Data Downloads}
}
\usage{
md_nces_directory
}
\description{
Combined data from XLS and XLSX format NCES directory files downloaded from
the MSDE Data Downloads website. The school name field has been corrected for
consistency and accuracy across years and capitalization of the city and
address fields have been standardized (previously used all upper case for
both prior to 2010). A grade span value is filled in for older records where
grade span was stored in the school type column.
}
\details{
Last updated 2024-02-22.
}
\keyword{datasets}
