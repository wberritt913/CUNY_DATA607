library(plumber)

#* @apiTitle Article Sentiment
#* @apiDescription API to subquery sentiment scores



#* Returns the mean of the avg_sentiment_score column for different parameters
#* Returns the mean of the avg_sentiment_score column for a specified date range
#* @param date_1 on or after (format YYYY-MM-DD)
#* @param date_2 on or before (format YYYY-MM-DD)
#* @get /avg_sentiment_score
function(date_1, date_2) {
  # Parse dates
  date1 <- as.Date(date_1)
  date2 <- as.Date(date_2)
  
  # Filtering based on date range
  filtered_df <- new_df %>%
    filter(
      publishedAt >= date1,
      publishedAt <= date2
    )
  
  # Calculate the mean of the avg_sentiment_score column
  mean_avg_sentiment_score <- mean(filtered_df$avg_sentiment_score, na.rm = TRUE)
  
  # Return the result
  return(mean_avg_sentiment_score)
}


