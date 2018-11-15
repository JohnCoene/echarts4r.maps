
#' Maps
#' 
#' Add map dependency to \link[echarts4r]{e_charts} chart.
#' 
#' @param e An object of class \code{echarts4r}.
#' @param maps Map names, a vector of  countries.
#' @param name the regist map name which can be used in e_map
#' 
#' @details essentially a wrapper to \link[echarts4r]{e_map_register}.
#' 
#' @examples 
#' 
#' #' \dontrun{
#'  maps <- c("China","Japan")
#'  library(echarts4r)
#'  df <- data.frame(x = "", y = "")
#'  df %>% 
#'    e_charts(x) %>%
#'    em_maps(maps,"user") %>% 
#'    e_map(y, map = "user") 
#'}
#'     
#' @export
em_maps <- function(e, maps,name){
  if(missing(e) || missing(maps))
    stop("missing e or maps", call. = FALSE)
  
  json = list()
  for (map in maps){
    file <- paste0(map, ".json")
    json_t <- jsonlite::read_json(
      system.file(file, package = "echarts4r.maps")
    )
    json = combine_json(json,json_t)
  }
  e <- echarts4r::e_map_register(e, name, json)
  return(e)
}

combine_json <- function(a,b){
  x = list()
  x$type = "FeatureCollection"
  x$features = c(a$features,b$features)
  x$UTF8Encoding = TRUE
  return(x)
}

