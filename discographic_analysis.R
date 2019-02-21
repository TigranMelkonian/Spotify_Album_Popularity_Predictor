agg_discography_data <- spotify_agg_data
artist_popularity <- aggregate(agg_discography_data$artist_popularity, by = list(agg_discography_data$artist_name), FUN = mean)
album_popularity <- aggregate(agg_discography_data$album_popularity, by = list(agg_discography_data$artist_name), FUN = mean)
data <- merge(artist_popularity, album_popularity, by = 'Group.1')
colnames(data)[1] <- "artist_name"
colnames(data)[2] <- "artist_popularity"
colnames(data)[3] <- "album_popularity"
num_followers <- aggregate(agg_discography_data$artist_num_followers, by = list(agg_discography_data$artist_name), FUN = mean)
data <- merge(data, num_followers, by = "artist_name")
colnames(data)[5] <- "num_followers"
overall_popularity <- (data$album_popularity + data$artist_popularity) /2
data <- cbind(data, overall_popularity)
data <- data[,-5]
agg_discography_data <- merge(agg_discography_data, data$overall_popularity, by = "artist_name")

num_albums <- data.frame(table(agg_discography_data$artist_name))
colnames(num_albums)[1] <- 'artist_name'
colnames(num_albums)[2] <- 'num_albums'
data <- merge(data, num_albums, by = 'artist_name')

agg_discography_data$artist_genres <- sapply(strsplit(agg_discography_data$artist_genres,","), `[`, 1)
counts <- table(agg_discography_data$artist_genres)
counts <- data.frame(counts)
barplot(counts)


####################
#attribute density distribution histograms
#######################

#plot histogram of track_popularity
ggplot(data=agg_discography_data, aes(x = agg_discography_data$track_popularity)) + 
  geom_histogram(aes(y =..density..), 
                 
                 col="black", 
                 fill="white", 
                 alpha = .2) +
  theme_classic()+
  theme_update(plot.title = element_text(hjust = 0.5))+
  geom_density(col=2) + 
  labs(title = "Histogram for Track Popularity Distribution") +
  labs(x="Track Popularity", y="Density")

#plot histogram of artist_num_followers
ggplot(data=agg_discography_data, aes(x = agg_discography_data$artist_num_followers)) + 
  geom_histogram(aes(y =..density..), 
                 col="black", 
                 fill="white", 
                 alpha = .2) +
  theme_classic()+
  theme_update(plot.title = element_text(hjust = 0.5))+
  geom_density(col=2) + 
  labs(title = "Histogram for Number of Spotify Followers Distribution") +
  labs(x="Number of Spotify Followers", y="Density")

#plot histogram of loudness
ggplot(data=agg_discography_data, aes(x = agg_discography_data$loudness)) + 
  geom_histogram(aes(y =..density..), 
                 col="black", 
                 fill="white", 
                 alpha = .2) +
  theme_classic()+
  theme_update(plot.title = element_text(hjust = 0.5))+
  geom_density(col=2) + 
  labs(title = "Histogram for Loudness Distribution") +
  labs(x="Loudness", y="Density")

#plot histogram of danceability
ggplot(data=agg_discography_data, aes(x = agg_discography_data$danceability)) + 
  geom_histogram(aes(y =..density..), 
                 col="black", 
                 fill="white", 
                 alpha = .2) +
  theme_classic()+
  theme_update(plot.title = element_text(hjust = 0.5))+
  geom_density(col=2) + 
  labs(title = "Histogram for Danceability Distribution") +
  labs(x="Danceability", y="Density")

#plot histogram of energy
ggplot(data=agg_discography_data, aes(x = agg_discography_data$energy)) + 
  geom_histogram(aes(y =..density..), 
                 col="black", 
                 fill="white", 
                 alpha = .2) +
  theme_classic()+
  theme_update(plot.title = element_text(hjust = 0.5))+
  geom_density(col=2) + 
  labs(title = "Histogram for Energy Distribution") +
  labs(x="Energy", y="Density")

#plot histogram of acousticness 
ggplot(data=agg_discography_data, aes(x = agg_discography_data$acousticness)) + 
  geom_histogram(aes(y =..density..), 
                 col="black", 
                 fill="white", 
                 alpha = .2) +
  theme_classic()+
  theme_update(plot.title = element_text(hjust = 0.5))+
  geom_density(col=2) + 
  labs(title = "Histogram for Acousticness Distribution") +
  labs(x="Acousticness", y="Density")

#plot histogram for instrumentalness
ggplot(data=agg_discography_data, aes(x = agg_discography_data$loudness)) + 
  geom_histogram(aes(y =..density..), 
                 col="black", 
                 fill="white", 
                 alpha = .2) +
  theme_classic()+
  theme_update(plot.title = element_text(hjust = 0.5))+
  geom_density(col=2) + 
  labs(title = "Histogram for Instrumentalness Distribution") +
  labs(x="Instrumentalness", y="Density")

#plot histogram for tempo
ggplot(data=agg_discography_data, aes(x = agg_discography_data$tempo)) + 
  geom_histogram(aes(y =..density..), 
                 col="black", 
                 fill="white", 
                 alpha = .2) +
  theme_classic()+
  theme_update(plot.title = element_text(hjust = 0.5))+
  geom_density(col=2) + 
  labs(title = "Histogram for Tempo Distribution") +
  labs(x="Tempo", y="Density")

#plot histogram for speechiness
ggplot(data=agg_discography_data, aes(x = agg_discography_data$speechiness)) + 
  geom_histogram(aes(y =..density..), 
                 col="black", 
                 fill="white", 
                 alpha = .2) +
  theme_classic()+
  theme_update(plot.title = element_text(hjust = 0.5))+
  geom_density(col=2) + 
  labs(title = "Histogram for Speechiness Distribution") +
  labs(x="Speechiness", y="Density")

#plot histogram for liveness
ggplot(data=agg_discography_data, aes(x = agg_discography_data$liveness)) + 
  geom_histogram(aes(y =..density..), 
                 col="black", 
                 fill="white", 
                 alpha = .2) +
  theme_classic()+
  theme_update(plot.title = element_text(hjust = 0.5))+
  geom_density(col=2) + 
  labs(title = "Histogram for Liveness Distribution") +
  labs(x="Liveness", y="Density")

#plot histogram for valence
ggplot(data=agg_discography_data, aes(x = agg_discography_data$valence)) + 
  geom_histogram(aes(y =..density..), 
                 col="black", 
                 fill="white", 
                 alpha = .2) +
  theme_classic()+
  theme_update(plot.title = element_text(hjust = 0.5))+
  geom_density(col=2) + 
  labs(title = "Histogram for Valence Distribution") +
  labs(x="Valence", y="Density")

#plot histogram for duration_ms
ggplot(data=agg_discography_data, aes(x = agg_discography_data$duration_ms))+
  geom_histogram(aes(y =..density..), 
                 col="black", 
                 fill="white", 
                 alpha = .2) +
  theme_classic()+
  theme_update(plot.title = element_text(hjust = 0.5))+
  geom_density(col=2) + 
  labs(title = "Histogram for Duration Distribution") +
  labs(x="Duration (ms)", y="Density")


#######################################################
#Correlation plot & regression plots
############################################3

res <- cor(agg_discography_data[, c(4:15,17,18)], method = 'pearson', use = 'complete.obs')
corrplot::corrplot(res, method = 'square')
chordDiagram(res)


#scatter plots 

ggplot(data=agg_discography_data,aes(x=track_popularity, y=artist_popularity)) + geom_point(col=rgb(0,0,215,5,maxColorValue=255), pch=19) + geom_smooth(method=glm,se=TRUE,size=0.5,color="red") + theme(panel.background = element_blank())
ggplot(data=agg_discography_data,aes(x=artist_num_followers, y=artist_popularity)) + geom_point(col=rgb(0,0,215,5,maxColorValue=255), pch=19) + geom_smooth(method=glm,se=TRUE,size=0.5,color="red") + theme(panel.background = element_blank())
ggplot(data=agg_discography_data,aes(x=loudness, y=artist_popularity)) + geom_point(col=rgb(0,0,215,5,maxColorValue=255), pch=19) + geom_smooth(method=glm,se=TRUE,size=0.5,color="red") + theme(panel.background = element_blank())
ggplot(data=agg_discography_data,aes(x=danceability, y=artist_popularity)) + geom_point(col=rgb(0,0,215,5,maxColorValue=255), pch=19) + geom_smooth(method=glm,se=TRUE,size=0.5,color="red") + theme(panel.background = element_blank())
ggplot(data=agg_discography_data,aes(x=energy, y=artist_popularity)) + geom_point(col=rgb(0,0,215,5,maxColorValue=255), pch=19) + geom_smooth(method=glm,se=TRUE,size=0.5,color="red") + theme(panel.background = element_blank())
ggplot(data=agg_discography_data,aes(x=acousticness, y=artist_popularity)) + geom_point(col=rgb(0,0,215,5,maxColorValue=255), pch=19) + geom_smooth(method=glm,se=TRUE,size=0.5,color="red") + theme(panel.background = element_blank())
ggplot(data=agg_discography_data,aes(x=instrumentalness, y=artist_popularity)) + geom_point(col=rgb(0,0,215,5,maxColorValue=255), pch=19) + geom_smooth(method=glm,se=TRUE,size=0.5,color="red") + theme(panel.background = element_blank())
ggplot(data=agg_discography_data,aes(x=tempo, y=artist_popularity)) + geom_point(col=rgb(0,0,215,5,maxColorValue=255), pch=19) + geom_smooth(method=glm,se=TRUE,size=0.5,color="red") + theme(panel.background = element_blank())
ggplot(data=agg_discography_data,aes(x=speechiness, y=artist_popularity)) + geom_point(col=rgb(0,0,215,5,maxColorValue=255), pch=19) + geom_smooth(method=glm,se=TRUE,size=0.5,color="red") + theme(panel.background = element_blank())
ggplot(data=agg_discography_data,aes(x=valence, y=artist_popularity)) + geom_point(col=rgb(0,0,215,5,maxColorValue=255), pch=19) + geom_smooth(method=glm,se=TRUE,size=0.5,color="red") + theme(panel.background = element_blank())
ggplot(data=agg_discography_data,aes(x=duration_ms, y=artist_popularity)) + geom_point(col=rgb(0,0,215,5,maxColorValue=255), pch=19) + geom_smooth(method=glm,se=TRUE,size=0.5,color="red") + theme(panel.background = element_blank())
ggplot(data=agg_discography_data,aes(x=liveness, y=artist_popularity)) + geom_point(col=rgb(0,0,215,5,maxColorValue=255), pch=19) + geom_smooth(method=glm,se=TRUE,size=0.5,color="red") + theme(panel.background = element_blank())


####################
#creating training and test data set
#############

## 75% of the sample size
smp_size <- floor(0.75 * nrow(agg_discography_data))

## set the seed to make your partition reproducible
set.seed(123)
train_ind <- sample(seq_len(nrow(agg_discography_data)), size = smp_size)

train <- agg_discography_data[train_ind, ]
test <- agg_discography_data[-train_ind, ]


#################
#Building the model
#################
#Random Forest model
train <- train[complete.cases(train), ]

model <- randomForest(artist_popularity ~ track_popularity + artist_num_followers + loudness + danceability + energy + acousticness + instrumentalness, data = train)
pred <- predict(model, newdata = test)
rfModelAccuracyAdjusted <- accuracy(test$artist_popularity, pred)

#multiple linear regression model
linearModel <- lm(artist_popularity ~ track_popularity + artist_num_followers + loudness + danceability + energy + acousticness + instrumentalness, data = train)
linearPred <- predict(linearModel, newdata = test)
lmModelAccuracyAdjusted <- accuracy(test$artist_popularity, linearPred)


rfPred <- data.frame(pred)
rfPred$actual <- test$artist_popularity

lmPred <- data.frame(linearPred)
lmPred$actual <- test$artist_popularity
rfPred <- data.frame(pred)
rfPred$actual <- test$artist_popularity
