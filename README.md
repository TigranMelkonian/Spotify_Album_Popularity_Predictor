# Spotify_Artist_Popularity_Predictor
#Introduction: 
In this project I analyzed the discographic characteristics of 300,000 tracks scraped from Spotify’s  API to identify which are the largest influencers on artist popularity and produce a predictive model for artist popularity. 

# Project Goals: 
Analyze the trend of music development over the past 100 years and produce models to predict artist popularity through machine learning algorithms. 

# Data Extraction and Cleaning: 
(include Spotify API link)
I used Spotify’s awesome API to extract data for 2185 celebrities over the past 100 years. 

Then I acquired track discographic data and number of followers for each artist by their name. 

I merged all the data into a single data frame and started feature manipulation to ensure the machine learning algorithms work as intended. Some examples of feature manipulation are removing NA’s, converting categorical features to numeric, converting character string to an actual date/time type, and simplifying the genres feature to include only the first element of each tracks genre list. 
The final cleaned data includes:    
    • Aggregated discographic features for each artist’s album 
    • Number of Spotify followers (updated 8/7/2018)                                          
    • Non-numeric features such as: artist name, album name, genres, and key mode                                
