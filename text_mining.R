#install.packages("gutenbergr")
#install.packages("tidytext")
#install.packages("textdata")
library(gutenbergr)
library(dplyr)
library(tidytext)

twit = read.csv("twitter_training.csv")

text_df <- tibble(line = 1:74681, text = twit)

text_df <- twit %>%
  unnest_tokens(word, 4)

text_stopped <- text_df %>%
  anti_join(stop_words)

text_stopped %>%
  count(word, sort = TRUE)


nrc <- get_sentiments(lexicon = "nrc")

nrc_twit <- inner_join(text_stopped, nrc, by = "word")

nrc_twit |> 
  count(sentiment, sort = TRUE)




