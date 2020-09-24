Tidy Data
================

``` r
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──

    ## ✓ ggplot2 3.2.1     ✓ purrr   0.3.3
    ## ✓ tibble  3.0.1     ✓ dplyr   1.0.2
    ## ✓ tidyr   1.0.2     ✓ stringr 1.4.0
    ## ✓ readr   1.3.1     ✓ forcats 0.4.0

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(haven)
```

## ‘pivot\_longer’

``` r
pulse_data = 
  haven::read_sas("./data/public_pulse_data.sas7bdat") %>%
  janitor::clean_names()
```

Wide format to long format… make columns (bdi\_score\_bl~bid\_score\_12m
into a category under “visit”)

``` r
pulse_data_tidy = 
  pulse_data %>%
  pivot_longer(
    bdi_score_bl:bdi_score_12m,
    names_to = "visit",
    names_prefix = "bdi_score_",
    values_to = "bdi"
  )
```

rewrite, combine, and extend (to add a mutate)

``` r
pulse_data = 
  haven::read_sas("./data/public_pulse_data.sas7bdat") %>%
  janitor::clean_names() %>%
  pivot_longer(
    bdi_score_bl:bdi_score_12m,
    names_to = "visit",
    names_prefix = "bdi_score_",
    values_to = "bdi"
  ) %>%
  relocate(id,visit) %>% #put id, visit to fist
  mutate(visit = recode(visit, "bl" = "00m"))
```

## ‘pivot\_wider’

Make up some data\!

``` r
analysis_result = 
  tibble(
    group = c("treatment", "treatment", "placebo", "placebo"),
    time = c("pre", "post", "pre", "post"),
    mean = c(4,8,3.5,4)
  )

analysis_result %>%
  pivot_wider (
    names_from = "time",
    values_from = "mean"
  )
```

    ## # A tibble: 2 x 3
    ##   group       pre  post
    ##   <chr>     <dbl> <dbl>
    ## 1 treatment   4       8
    ## 2 placebo     3.5     4

## Binding rows

using the LotR data

First step: import each table.

``` r
fellowship_rimg = 
  readxl :: read_excel("./data/LotR_Words.xlsx", range= "B3:D6") %>%
  mutate(movie = "fellowship_ring")
two_towers = 
  readxl :: read_excel("./data/LotR_Words.xlsx", range= "F3:H6") %>%
  mutate(movie = "two_towers")
return_king = 
  readxl :: read_excel("./data/LotR_Words.xlsx", range= "J3:L6") %>%
  mutate(movie = "return_king")
```

Bind all the rows together

``` r
lotr_tidy = 
  bind_rows(fellowship_rimg, two_towers, return_king) %>%
  janitor::clean_names() %>%
  relocate(movie)%>%
  pivot_longer(
    female:male,
    names_to = "gender",
    values_to = "words"
  )
```
