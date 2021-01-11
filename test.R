library(echarts4r)
library(echarts4r.maps)

nz_file <- system.file("New_Zealand.json", package = "echarts4r.maps") 
nz_json <- jsonlite::read_json(nz_file)

# identify polygon causing issues
library(purrr)

# get names of polygons
names <- nz_json$features %>% 
  map("properties") %>% 
  map("name") %>% 
  unlist()

island_index <- grep("Chatham", names)

nz_json$features[[island_index]] <- NULL

e_charts() %>%
  e_map_register("NZ", nz_json) %>%
  e_map(map = "NZ")
