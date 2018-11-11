#' Maps
#' 
#' Add map dependency to \link[echarts4r]{e_charts} chart.
#' 
#' @param e An object of class \code{echarts4r}.
#' @param map Map name, a country.
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
#'   e_map(y, mapType = "法国", map = NULL) 
#' 
#' @name maps
#' @export
em_map <- function(e, map){
  
  if(missing(e) || missing(map))
    stop("missing e or map", call. = FALSE)
  
  map <- paste0(map, ".js")
  
  dependency <- htmltools::htmlDependency(
    name = map,
    version = "1.0.4",
    src = system.file("", package = "echarts4r.maps"),
    script = map
  )
  
  e$dependencies <- append(e$dependencies, list(dependency))
  
  return(e)
}

#' @rdname maps
#' @export
em_bank <- function(){
  files <- list.files(
    system.file("", package = "echarts4r.maps")
  )
  
  gsub(".js", "", files)
}