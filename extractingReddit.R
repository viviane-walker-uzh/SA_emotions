# extracting Reddit posts with RedditExtractoR package
# UZH CL - Language Technology Seminar - Autumn Semester 2023
# author: Viviane Walker

# install required packages for this code
install.packages('devtools') #assuming it is not already installed
install.packages("here")
require(devtools)
install_github('ivan-rivera/RedditExtractoR')

# activate packages
require("RedditExtractoR")
require("here")


##### AWE #####

# create empty dataframe
df_awe = data.frame(
  date_utc = character(0),
  timestamp = numeric(0),
  title = character(0),
  text = character(0),
  subreddit = character(0),
  comments = numeric(0),
  url = character(0),
  search_keyword = character(0)
)

# read awe keywords in
awe_keywords <- scan(here("keywords/awe_keywords.txt"), what = "token", sep = ",")


# loop through keywords and extract posts from r/de with keywords
for (keyword in awe_keywords) {

  keyword_clean = substr(keyword, 3, nchar(keyword)-1)
  current_df <- RedditExtractoR::find_thread_urls(keywords = keyword_clean, sort_by = "top", subreddit = "de", period = "all")

  if (length(dim(current_df)) == 0){
    rm(current_df)
    print(paste(keyword_clean, ": found no posts with this keyword", sep=""))
    } else {
      current_df$search_keyword <- keyword_clean
      df_awe <- rbind(df_awe, current_df)
      rm(current_df)
  }
}
# export as csv
write.csv(df_awe, "data/awe_reddit_data.csv", row.names = FALSE)


#### GRATITUDE ####

# create empty dataframe
df_gratitude = data.frame(
  date_utc = character(0),
  timestamp = numeric(0),
  title = character(0),
  text = character(0),
  subreddit = character(0),
  comments = numeric(0),
  url = character(0),
  search_keyword = character(0)
)

# read gratitude keywords in
gratitude_keywords <- scan(here("keywords/gratitude_keywords.txt"), what = "token", sep = ",")


# loop through keywords and extract posts from r/de with keywords
for (keyword in gratitude_keywords) {
  
  keyword_clean = substr(keyword, 3, nchar(keyword)-1)
  current_df <- RedditExtractoR::find_thread_urls(keywords = keyword_clean, sort_by = "top", subreddit = "de", period = "all")
  
  if (length(dim(current_df)) == 0){
    rm(current_df)
    print(paste(keyword_clean, ": found no posts with this keyword", sep=""))
  } else {
    current_df$search_keyword <- keyword_clean
    df_gratitude <- rbind(df_gratitude, current_df)
    rm(current_df)
  }
}
# export as csv
write.csv(df_gratitude, "data/gratitude_reddit_data.csv", row.names = FALSE)


#### HOPE ####

# create empty dataframe
df_hope = data.frame(
  date_utc = character(0),
  timestamp = numeric(0),
  title = character(0),
  text = character(0),
  subreddit = character(0),
  comments = numeric(0),
  url = character(0),
  search_keyword = character(0)
)

# read hope keywords in
hope_keywords <- scan(here("keywords/hope_keywords.txt"), what = "token", sep = ",")


# loop through keywords and extract posts from r/de with keywords
for (keyword in hope_keywords) {
  
  keyword_clean = substr(keyword, 3, nchar(keyword)-1)
  current_df <- RedditExtractoR::find_thread_urls(keywords = keyword_clean, sort_by = "top", subreddit = "de", period = "all")
  
  if (length(dim(current_df)) == 0){
    rm(current_df)
    print(paste(keyword_clean, ": found no posts with this keyword", sep=""))
  } else {
    current_df$search_keyword <- keyword_clean
    df_hope <- rbind(df_hope, current_df)
    rm(current_df)
  }
}
# export as csv
write.csv(df_hope, "data/hope_reddit_data.csv", row.names = FALSE)