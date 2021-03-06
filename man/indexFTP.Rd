% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/indexFTP.R
\name{indexFTP}
\alias{indexFTP}
\title{Create a recursive index of an FTP Server}
\usage{
indexFTP(
  folder = "currentfindex",
  base = dwdbase,
  is.file.if.has.dot = TRUE,
  exclude.latest.bin = TRUE,
  sleep = 0,
  dir = "DWDdata",
  filename = folder[1],
  overwrite = FALSE,
  quiet = rdwdquiet(),
  progbar = !quiet,
  verbose = FALSE
)
}
\arguments{
\item{folder}{Folder(s) to be indexed recursively, e.g. "/hourly/wind/".
Leading slashes will be removed. 
Use \code{folder=""} to search at the location of \code{base} itself.
If \code{folder} is "currentfindex" (the default) and \code{base} 
is the default, \code{folder} is changed to all observational 
folders listed in the current tree file at 
\url{ftp://opendata.dwd.de/weather/tree.html}. With "currentgindex" 
and \code{gridbase}, the grid folders in the tree are used.
DEFAULT: "currentfindex"}

\item{base}{Main directory of FTP server. Trailing slashes will be removed. 
DEFAULT: \code{\link{dwdbase}}}

\item{is.file.if.has.dot}{Logical: if some of the input paths contain a dot, 
treat those as files, i.e. do not try to read those as if they
were a folder. Only set this to FALSE if you know what you're doing.
DEFAULT: TRUE}

\item{exclude.latest.bin}{Exclude latest file at opendata.dwd.de/weather/radar/radolan?
RCurl::getURL indicates this is a pointer to the last regularly named file.
DEFAULT: TRUE}

\item{sleep}{If not 0, a random number of seconds between 0 and \code{sleep}
is passed to \code{\link{Sys.sleep}} after each read folder
to avoid getting kicked off the FTP-Server. DEFAULT: 0}

\item{dir}{Writeable directory name where to save the downloaded file.
Created if not existent.
DEFAULT: "DWDdata" at current \code{\link{getwd}()}}

\item{filename}{Character: Part of output filename. "INDEX_of_DWD_" is prepended,
"/" replaced with "_", ".txt" appended. DEFAULT: folder[1]}

\item{overwrite}{Logical: Overwrite existing file? If not, "_n" is added to the
filename, see \code{berryFunctions::\link[berryFunctions]{newFilename}}.
DEFAULT: FALSE}

\item{quiet}{Suppress progbars and message about directory/files? 
DEFAULT: FALSE through \code{\link{rdwdquiet}()}}

\item{progbar}{Logical: present a progress bar in each level? DEFAULT: TRUE}

\item{verbose}{Logical: write a lot of messages from \code{RCurl::\link[RCurl]{getURL}}?
DEFAULT: FALSE (usually, you dont need all the curl information)}
}
\value{
a vector with file paths
}
\description{
Create a list of all the files (in all subfolders) of an FTP server.
Defaults to the German Weather Service (DWD, Deutscher WetterDienst) OpenData server at
\url{ftp://opendata.dwd.de/climate_environment/CDC/observations_germany/climate/}.\cr\cr
The R package \code{RCurl} must be available to do this.
If \code{RCurl::\link[RCurl]{getURL}} fails, usually because bot access is
detected and denied, there will still be an output which you can pass in a
second run via \code{folder} to extract the remaining dirs.
You might want to wait a bit and set \code{sleep} to a higher value in that case. 
Here's an example:\cr
\code{gridindex <- indexFTP("", gridbase)}\cr
\code{gridindex <- indexFTP(gridindex, gridbase, sleep=1)}\cr
}
\details{
It's not suggested to run this for all folders, as it can take quite some time
and you may get kicked off the FTP-Server. This package contains an index
of the climatic observations at weather stations: \code{View(rdwd:::\link{fileIndex})}.
If it is out of date, please let me know!
}
\examples{
\dontrun{ ## Needs internet connection
sol <- indexFTP(folder="/daily/solar", dir=tempdir())
head(sol)

# mon <- indexFTP(folder="/monthly/kl", dir=tempdir(), verbose=TRUE)
}

}
\seealso{
\code{\link{createIndex}}, \code{\link{updateIndexes}}
}
\author{
Berry Boessenkool, \email{berry-b@gmx.de}, Oct 2016
}
\keyword{file}
