# Spotify Artist Popularity Predictor

# Introduction: 
In this project I analyzed the discographic characteristics of 300,000 tracks scraped from Spotify’s API to identify which are the largest influencers on artist popularity and produce a predictive model for artist popularity. 

How can we predict the greatness of an artist from historical discographic data and popular preferences? This question puzzled me for a long time since there is no universal way to claim the popularity of an artist. Many people rely on critics to gauge the quality of a artist, while others use their instincts. 

Given that hundreds of albums are produced each year, There has to be a better way for us to tell the greatness of movie without relying on critics or our own instincts.

# Project Goals: 
Analyze the trend of music development over the past 100 years and produce models to predict artist popularity through machine learning algorithms. 

Here’s a quick summary of my approach:

* Get the data from Spotify API
* Process the data to extract audio features for each artist
* Analyze and visualize each discographic feature for all the artists
* Apply Multiple Linear Regression and Random Forest modeling to predict artist popularity

# Data Extraction and Cleaning: 
I used [Spotify’s awesome API](https://developer.spotify.com/documentation/web-api/) to extract data for 2185 celebrities over the past 100 years. 

Then I acquired track discographic data and number of followers for each artist by their name. 
```R
devtools::install_github('charlie86/spotifyr')
library(spotifyr)

#set system enviroment variables for client ID and Secret ID
Sys.setenv(SPOTIFY_CLIENT_ID = '##########################')
Sys.setenv(SPOTIFY_CLIENT_SECRET = '##########################')

access_token <- get_spotify_access_token()

#pull in artist metrics such as genere, num followers, and popularity
for (i in 1:nrow(spotify_artists)) {
  if (i == 1){
    numFollowers <- get_artists(as.character(spotify_artists$dbname[i]))
  }else {
    tryCatch({
      numFollowers <- rbind(numFollowers, get_artists(as.character(spotify_artists$dbname[i])))},error=function(cond)
      {
        NA
      })
  }
  cat(paste0('\nFinished: ', i, ". Starting next loop on " , i+1, sep =' '))
}

#pull in album audio features 
for (i in 1:nrow(spotify_artists)) {
  if (i == 1){
    final_data <- get_artist_audio_features(as.character(spotify_artists$dbname[i]))
  }else {
    tryCatch({
      final_data <- rbind(final_data, get_artist_audio_features(as.character(spotify_artists$dbname[i])))},error=function(cond)
      {
        NA
      })
  }
  cat(paste0('\nFinished: ', i, ". Starting next loop on " , i+1, sep =' '))
}
```
I merged all the data into a single data frame and started feature manipulation to ensure the machine learning algorithms work as intended. Some examples of feature manipulation are removing NA’s, converting categorical features to numeric, converting character string to an actual date/time type, and simplifying the genres feature to include only the first element of each tracks genre list. 
The final cleaned data includes (check out the final_data_csv file to get a glimps of the cleaned dataset used for analyses + prediciton modeling):   

    • Aggregated discographic features for each artist’s album 
    • Number of Spotify followers (updated 8/7/2018)                                          
    • Non-numeric features such as: artist name, album name, genres, and key mode 
(include the head of a final spotify dataset here)

___
# Exploratory Data Analysis and Data visualization for Determining Feature Predictive Importance
  ## Popularity Analysis by numeric discographic features:
 ![alt text](https://github.com/TigranMelkonian/Spotify_Artist_Popularity_Predictor/blob/master/discography_histograms.png "Numeric Discography Distributions")
 
 ![alttext](https://github.com/TigranMelkonian/Spotify_Artist_Popularity_Predictor/blob/master/regression_plot_artist_popularity.png "Regression plots")
   ### Correlation matrix between numeric discographic features
   ![alttext](https://github.com/TigranMelkonian/Spotify_Artist_Popularity_Predictor/blob/master/correlation_matrix.png "Correlation Matrix")
   
   
  ## Popularity Analysis by Genres
  
  ## Prediction Model Discographic Feature Selection
Although initially I scraped 15 variables from Spotify pertaining to album level discographic data, many variables  were not applicable to predict artist popularity due to poor correlations, so I  only selected the 7 variables that showcased relatively strong corelations with artist popularity and promising regression relations from the plots above.

  ## Multiple Linear Regression
   Multiple Linear Regression model was fitted to predict artist popularity using the following variables:
   * Track Popularity
   * Number of Spotify Followers
   * Loudness
   * Danceability
   * Energy
   * Acousticness
   * Instrumentalness
   
  ## Random Forrest Regression 
   Random Forest model was fitted to predict artist popularity using the following variables:
   * Track Popularity
   * Number of Spotify Followers
   * Loudness
   * Danceability
   * Energy
   * Acousticness
   * Instrumentalness
  
The dataset was divided into two parts, 75% of the albums were treated as the training set, and the rest 25% belonged to the testing set. Up to 5000 trees were generated to fit the random forest. 
