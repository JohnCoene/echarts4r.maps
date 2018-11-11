# echarts4r.maps

Maps for [echarts4r](https://echarts4r.john-coene.com/)

## Installation

``` r
install.packages("remotes")
remotes::install_github('JohnCoene/echarts4r.maps')
```

## Example

``` r
maps <- em_bank() # list of all maps

library(echarts4r)

df <- data.frame(x = "", y = "")

df %>% 
  e_charts(x) %>%
  em_map("France") %>% 
  e_map(y, mapType = "法国", map = NULL)
```

