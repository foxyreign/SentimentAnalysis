###### Libraries
install.packages("twitteR")
install.packages("ROAuth")
install.packages("RCurl")
library(twitteR)
library(ROAuth)
library(RCurl)
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

###### Twitter oAuth
download.file(url = "http://curl.haxx.se/ca/cacert.pem", destfile = "cacert.pem")
save(Credentials, file="credentials.RData")

reqURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
consumerKey <- "MVdO2NE4xnSoxngifkW41A"
consumerSecret <- "oRZ9ff2yWvfMa9IBMRxia5ti61XWERUX4jVGozac"
twitCred <- OAuthFactory$new(consumerKey = consumerKey,
                             consumerSecret = consumerSecret,
                             requestURL = reqURL,
                             accessURL = accessURL,
                             authURL = authURL)
twitCred$handshake(cainfo = "cacert.pem")

# Pause to enter the PIN from oAuth
registerTwitterOAuth(twitCred)

# Get the 2000 most recent tweets mentioning @FoxyReign
foxyreign <- searchTwitter("@foxyreign", n = 2000)

length(foxyreign)
class(foxyreign)

tweet <- foxyreign[[1]]
class(tweet)

tweet$getScreenName()
tweet$getText()
