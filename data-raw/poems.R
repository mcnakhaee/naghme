## code to prepare `poems` dataset goes here
library(tidyverse)
library(tidytext)
stopwords_fa <-  read_delim('data-raw/stopwords.csv',delim = '\t')
word_counts <- beyt::poems %>% 
  unnest_tokens(word,poem) %>% 
  anti_join(stopwords_fa) %>% 
  count(word,poet,century,sort =  TRUE) 

usethis::use_data(word_counts, overwrite = TRUE)
