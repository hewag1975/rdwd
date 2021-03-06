% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/projectRasterDWD.R
\name{projectRasterDWD}
\alias{projectRasterDWD}
\title{project DWD raster data}
\usage{
projectRasterDWD(
  r,
  proj = "radolan",
  extent = "radolan",
  targetproj = "ll",
  quiet = rdwdquiet()
)
}
\arguments{
\item{r}{Raster object}

\item{proj}{Current projection to be given to \code{r}. Can be\cr - a
\code{raster::\link[raster:projection]{crs}} input (e.g. a projection
character string),\cr - NULL to not set proj+extent (but still consider
\code{targetproj}),\cr - or a special charstring for internal defaults, namely:
"radolan" (readDWD.binary + .asc + .radar), "seasonal" (.raster) or "nc"
(.nc).\cr DEFAULT: "radolan"}

\item{extent}{Current \code{\link[raster]{extent}} to be given to \code{r}.
Ignored if \code{proj=NULL}. Can be an extent object, a vector with 4
numbers, or "radolan" / "rw" / "seasonal" / "nc" with internal defaults.
DEFAULT: "radolan"}

\item{targetproj}{\code{r} is reprojected to this
\code{\link[raster:projection]{crs}}. Use NULL to not reproject (i.e. only
set proj and extent) DEFAULT: "ll" with internal default for lat-lon.}

\item{quiet}{Logical: suppress progress messages? DEFAULT: FALSE through \code{\link{rdwdquiet}()}}
}
\value{
Raster object with projection and extent, invisible
}
\description{
Set projection and extent for DWD raster data. Optionally (and
  per default) also reprojects to latlon data.\cr\cr
  \bold{WARNING:} reprojection to latlon changes values slightly. For the
  tested RX product, this change is significant, see:
  \url{https://github.com/brry/rdwd/blob/master/misc/ExampleTests/Radartests.pdf}\cr
   In raster::plot, \bold{use zlim with the original range} if needed.
}
\details{
The internal defaults are extracted from the Kompositformatbeschreibung at
  \url{https://www.dwd.de/DE/leistungen/radolan/radolan.html}, as provided
  2019-04 by Antonia Hengst.\cr The nc extent was obtained by projecting
  Germanys bbox to EPSG 3034 (specified in the DWD documentation). Using that
  as a starting point, I then refined the extent to a visual match, see
  \href{https://github.com/brry/rdwd/blob/master/misc/developmentNotes.R}{developmentNotes.R}\cr\cr
}
\examples{
# To be used after readDWD.binary etc
}
\seealso{
\code{raster::\link[raster:projection]{crs},
  \link[raster]{projection},\link[raster]{extent},\link[raster]{projectRaster}}\cr
   \code{\link{readDWD.binary}, \link{readDWD.raster}, \link{readDWD.asc},
  \link{readDWD.radar}, \link{readDWD.nc}}
}
\author{
Berry Boessenkool, \email{berry-b@gmx.de}, May 2019
}
\keyword{aplot}
