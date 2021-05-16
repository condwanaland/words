library(jsonlite)

gen_links <- function(num){
  paste0(
    "https://www.wordgamedictionary.com/word-lists/",
    num,
    "-letter-words/",
    num,
    "-letter-words.json"
  )
}

all_links <- lapply(2:15, gen_links)

dfs <- lapply(all_links, function(x){
  jsonlite::fromJSON(x)
})

words <- do.call(rbind, dfs)

words$word_length <- nchar(words$word)

rm(all_links)
rm(dfs)

usethis::use_data(words, overwrite = TRUE)
