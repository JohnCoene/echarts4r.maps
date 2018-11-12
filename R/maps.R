#' Maps
#' 
#' Add map dependency to \link[echarts4r]{e_charts} chart.
#' 
#' @param e An object of class \code{echarts4r}.
#' @param map Map name, a country.
#' 
#' @details essentially a wrapper to \link[echarts4r]{e_map_register}.
#' 
#' @examples 
#' maps <- em_bank() # list of all maps
#' 
#' library(echarts4r)
#' 
#' df <- data.frame(x = "", y = "")
#' 
#' df %>% 
#'   e_charts(x) %>%
#'   em_map("France") %>% 
#'   e_map(y, map = "france") 
#' 
#' @name maps
#' @export
em_map <- function(e, map){
  
  if(missing(e) || missing(map))
    stop("missing e or map", call. = FALSE)
  
  file <- paste0(map, ".json")
  
  json <- jsonlite::read_json(
    system.file(file, package = "echarts4r.maps")
  )
  
  e <- echarts4r::e_map_register(e, map, json)
  return(e)
}

#' @rdname maps
#' @export
em_bank <- function(){
  files <- list.files(
    system.file("", package = "echarts4r.maps")
  )
  
  files <- files[grepl(".json", files)]
  
  gsub(".json", "", files)
}