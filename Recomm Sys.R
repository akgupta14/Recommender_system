install.packages("recommenderlab", dependencies = TRUE)
install.packages("Matrix")
install.packages("caTools")
install.packages("plyr")
library(recommenderlab)
library(Matrix)
library(caTools)
library(plyr)
movie_data <- read.csv(file.choose())
str(movie_data)
hist(movie_data$Book.Rating)
movie_data_matrix <- as(movie_data,'realRatingMatrix')
movie_data_matrix@data
movie_data2 <- Recommender(movie_data_matrix, method = "UBCF")
recommenderitems <- predict(movie_data2, movie_data_matrix [c(10:35),], n=5)
d <- as(recommenderitems, "list")
d

library(plyr)
df <- ldply (d, data.frame)
write.csv(df, "RE_movies.csv")

recommended_items1 <- predict(movie_data2, movie_data_matrix, n=5)
as(recommenderitems, "list")
