#' TheLIST WFS service
#'
#' @return data source name of TheLIST WFS Server
#' @export
#'
#' @examples
#' thelist_wfs()
#' library(lazysf)
#' address <- lazysf(thelist_wfs(), thelist_layer("address"))
#' address
thelist_wfs <- function() {
  "WFS:https://services.thelist.tas.gov.au/arcgis/services/Public/OpenDataWFS/MapServer/WFSServer"
}


#' Find layer by pattern
#'
#' List layers have names like "Public_OpenDataWFS:LIST_Cadastral_Parcels", so we have a
#' simple string lookup to find the right layer.
#'
#' Approximate matching is used, if you need to be exact look at [list_layers] and choose it deliberately.
#'
#' @param x string pattern to match, e.g. "cadastral"
#' @param random allow random selection of one ignoring 'x', 'FALSE' by default
#'
#' @return character string, one of [list_layers]
#' @export
#'
#' @examples
#' thelist_layer("cadastral")
#' thelist_layer("cadastre")
#' thelist_layer(random = TRUE)
thelist_layer <- function(x, random = FALSE) {
  if (random) return(sample(list_layers, 1L))
  agrep(x, list_layers, max.distance = .1, ignore.case = TRUE, value = TRUE)[1L]
}
