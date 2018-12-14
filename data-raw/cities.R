path <- "data-raw/cities/"
files <- list.files(path)
files <- paste0(path, files)

get_city <- function(x){
  json <- tryCatch(
    jsonlite::fromJSON(x),
    error = function(e) e
  )
  if(!inherits(json, "error")){
    dat <- purrr::map_df(json, function(x){
      data.frame(lon = x[1], lat = x[2])
    })
    dat$country <- gsub("data-raw/cities/|.json", "", x)
    dat$city <- names(json)
    return(dat)
  } 
}

cities <- purrr::map_df(files, get_city)

usethis::use_data(cities, overwrite = TRUE)
