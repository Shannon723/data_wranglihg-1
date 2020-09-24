Data Import
================

``` r
library(tidyverse)
```

    ## ── Attaching packages ────────────────────── tidyverse 1.3.0 ──

    ## ✓ ggplot2 3.2.1     ✓ purrr   0.3.3
    ## ✓ tibble  3.0.1     ✓ dplyr   0.8.3
    ## ✓ tidyr   1.0.2     ✓ stringr 1.4.0
    ## ✓ readr   1.3.1     ✓ forcats 0.4.0

    ## ── Conflicts ───────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(readxl)
library(haven)
```

## Read in some data

Read in the litters dataset.

``` r
litters_df = read_csv("./data/FAS_litters.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   Group = col_character(),
    ##   `Litter Number` = col_character(),
    ##   `GD0 weight` = col_double(),
    ##   `GD18 weight` = col_double(),
    ##   `GD of Birth` = col_double(),
    ##   `Pups born alive` = col_double(),
    ##   `Pups dead @ birth` = col_double(),
    ##   `Pups survive` = col_double()
    ## )

``` r
litters_df = janitor::clean_names(litters_df)
```

## Take a look at the data

Printing in the console.

``` r
litters_df
```

    ## # A tibble: 49 x 8
    ##    group litter_number gd0_weight gd18_weight gd_of_birth pups_born_alive
    ##    <chr> <chr>              <dbl>       <dbl>       <dbl>           <dbl>
    ##  1 Con7  #85                 19.7        34.7          20               3
    ##  2 Con7  #1/2/95/2           27          42            19               8
    ##  3 Con7  #5/5/3/83/3-3       26          41.4          19               6
    ##  4 Con7  #5/4/2/95/2         28.5        44.1          19               5
    ##  5 Con7  #4/2/95/3-3         NA          NA            20               6
    ##  6 Con7  #2/2/95/3-2         NA          NA            20               6
    ##  7 Con7  #1/5/3/83/3-…       NA          NA            20               9
    ##  8 Con8  #3/83/3-3           NA          NA            20               9
    ##  9 Con8  #2/95/3             NA          NA            20               8
    ## 10 Con8  #3/5/2/2/95         28.5        NA            20               8
    ## # … with 39 more rows, and 2 more variables: pups_dead_birth <dbl>,
    ## #   pups_survive <dbl>

## Options to read\_csv

check out “read\_csv()” for more information.

## Other file formats

Read in an excel file.

``` r
mlb_df = read_excel("./data/mlb11.xlsx")
mlb_df
```

    ## # A tibble: 30 x 12
    ##    team   runs at_bats  hits homeruns bat_avg strikeouts stolen_bases  wins
    ##    <chr> <dbl>   <dbl> <dbl>    <dbl>   <dbl>      <dbl>        <dbl> <dbl>
    ##  1 Texa…   855    5659  1599      210   0.283        930          143    96
    ##  2 Bost…   875    5710  1600      203   0.28        1108          102    90
    ##  3 Detr…   787    5563  1540      169   0.277       1143           49    95
    ##  4 Kans…   730    5672  1560      129   0.275       1006          153    71
    ##  5 St. …   762    5532  1513      162   0.273        978           57    90
    ##  6 New …   718    5600  1477      108   0.264       1085          130    77
    ##  7 New …   867    5518  1452      222   0.263       1138          147    97
    ##  8 Milw…   721    5447  1422      185   0.261       1083           94    96
    ##  9 Colo…   735    5544  1429      163   0.258       1201          118    73
    ## 10 Hous…   615    5598  1442       95   0.258       1164          118    56
    ## # … with 20 more rows, and 3 more variables: new_onbase <dbl>, new_slug <dbl>,
    ## #   new_obs <dbl>

Read in a SAS file.

``` r
pulse_df = read_sas("./data/public_pulse_data.sas7bdat")
pulse_df
```

    ## # A tibble: 1,087 x 7
    ##       ID   age Sex    BDIScore_BL BDIScore_01m BDIScore_06m BDIScore_12m
    ##    <dbl> <dbl> <chr>        <dbl>        <dbl>        <dbl>        <dbl>
    ##  1 10003  48.0 male             7            1            2            0
    ##  2 10015  72.5 male             6           NA           NA           NA
    ##  3 10022  58.5 male            14            3            8           NA
    ##  4 10026  72.7 male            20            6           18           16
    ##  5 10035  60.4 male             4            0            1            2
    ##  6 10050  84.7 male             2           10           12            8
    ##  7 10078  31.3 male             4            0           NA           NA
    ##  8 10088  56.9 male             5           NA            0            2
    ##  9 10091  76.0 male             0            3            4            0
    ## 10 10092  74.2 female          10            2           11            6
    ## # … with 1,077 more rows
