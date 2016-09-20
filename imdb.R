# ggplot2, gridExtra, readr are loaded

# We seek to visualize movies over the past few decades to see how quality (or perceived quality at least) has changed over time.

# Load the data
movies <- read.csv("movie_metadata.csv", stringsAsFactor = TRUE)

# This subsets the movies to only those which have been voted on by more than 20000 users
movies <- subset(movies, num_voted_users >= 20000)

# To remove any rows with missing values
movies <- na.omit(movies)

# Reducing the data.frame to relevant variables
keeps <- c("imdb_score", "title_year")
movies <- movies[keeps]

# Subsetting movies into the past four decades
tens <- subset(movies, title_year >= 2010) 
zeroes <- subset(movies, title_year >= 2000 & title_year < 2010)
nineties <- subset(movies, title_year >= 1990 & title_year < 2000)
eighties <- subset(movies, title_year >= 1980 & title_year < 1990)

# Boxplots of rating of movies of each year from 2010 on
tens_plot <- ggplot(tens, aes(x = factor(title_year), y = imdb_score)) + geom_boxplot()
tens_plot <- tens_plot + theme(legend.position = "none") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_y_continuous(breaks = seq(0,10,2))
tens_plot <- tens_plot + labs(title = "2010s Films", x = "Year of Release", y = "IMDB Rating")
tens_plot

# for 2000-2010
zeroes_plot <- ggplot(zeroes, aes(x = factor(title_year), y = imdb_score)) + geom_boxplot()
zeroes_plot <- zeroes_plot + theme(legend.position = "none") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_y_continuous(breaks = seq(0,10,2))
zeroes_plot <- zeroes_plot + labs(title = "2000s Films", x = "Year of Release", y = "IMDB Rating")
zeroes_plot

# for 1990-2000
nineties_plot <- ggplot(nineties, aes(x = factor(title_year), y = imdb_score)) + geom_boxplot()
nineties_plot <- nineties_plot + theme(legend.position = "none") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_y_continuous(breaks = seq(0,10,2))
nineties_plot <- nineties_plot + labs(title = "1990s Films", x = "Year of Release", y = "IMDB Rating")
nineties_plot

# for 1980-1990
eighties_plot <- ggplot(eighties, aes(x = factor(title_year), y = imdb_score)) + geom_boxplot()
eighties_plot <- eighties_plot + theme(legend.position = "none") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_y_continuous(breaks = seq(0,10,2))
eighties_plot <- eighties_plot + labs(title = "1980s Films", x = "Year of Release", y = "IMDB Rating")
eighties_plot

# Collecting all four plots together
grid.arrange(tens_plot, zeroes_plot, nineties_plot, eighties_plot, nrow=2, ncol=2, top = "IMDB Ratings Over the Decades")

# Data found on Kaggle.com (https://www.kaggle.com/deepmatrix/imdb-5000-movie-dataset) and drawn from the Internet Movie Database (imdb.com)
