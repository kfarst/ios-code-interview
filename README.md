# Movie Database App

Build an iPhone app which pulls movie listings from The Movie Database (TMDB). Documentation can be found [here](https://developers.themoviedb.org/3/movies). The app should:

## Specs

* Language: Objective-C (Swift for unit tests)
* Minimum supported iOS version: 10.0
* Orientation support: Portrait only
* Device support: iPhone only
* Localizations: Not needed
* Dependencies (app is slightly structured toward these packages, however everything can be built with
  native-only APIs or dependencies of your choice):
  * [JSONModel](https://github.com/jsonmodel/jsonmodel)
  * [SDWebImage](https://github.com/rs/SDWebImage)
  * [UIActivityIndicator-for-SDWebImage](https://github.com/JJSaccolo/UIActivityIndicator-for-SDWebImage)
  * [PromiseKit](https://github.com/mxcl/PromiseKit)
* Dependency management: [Cocoapods](https://github.com/CocoaPods/CocoaPods) (can change to your choice)

## Requirements
* List movie categories as a `UITabBar`, with the following categories:
  * [Now Playing](https://developers.themoviedb.org/3/movies/get-now-playing)
  * [Popular](https://developers.themoviedb.org/3/movies/get-popular-movies)
  * [Top Rated](https://developers.themoviedb.org/3/movies/get-top-rated-movies)
  * [Upcoming](https://developers.themoviedb.org/3/movies/get-upcoming)
* Display results for each list in a `UITableView`
* In each table cell, display the `title`, `overview`, and `posterPath` of the movie
* Load the `posterPath` image asynchronously
* Add at least one unit test, written in **Swift**

<img src="https://i.imgur.com/4jmSrrZ.png" alt="Screenshot" width="50%" />
