library(tidyverse)
y = c(1,3,6,12)
example_df = tibble(
  vec_numeric = 1:4,
  vec_char = c("My", "name", "is", "Shannon"),
  vec_factor = factor(c("male", "male", "female", "male"))
  
)
example_df
