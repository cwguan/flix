//
//  Movie.swift
//  flix
//
//  Created by Christopher Guan on 2/28/18.
//  Copyright © 2018 Christopher Guan. All rights reserved.
//

import Foundation

class Movie {
    var title: String
    var overview: String
    var releaseDate: String
    var trailerKey: String?
    var id: String?
    
    var backdropURL: URL?
    var posterURL: URL?
    
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        overview = dictionary["overview"] as? String ?? "No overview"
        releaseDate = dictionary["release_date"] as? String ?? "No Release Data"
        id = dictionary["id"] as? String ?? "No id"
        
        // Get the path string to the backdrop and poster
        let posterPathString = dictionary["poster_path"] as! String
        let backdropPathString = dictionary["backdrop_path"] as! String
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        
        // Use strings to create URLs from poster and backdrop
        backdropURL = URL(string: baseURLString + backdropPathString)!
        posterURL = URL(string: baseURLString + posterPathString)!
        
        // Get the trailerKey
        let movieID = String(format: "%@", dictionary["id"] as! CVarArg)
        let requestURLString = "https://api.themoviedb.org/3/movie/" + movieID + "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US"
        let url = URL(string: requestURLString)!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let videos = dataDictionary["results"] as! [[String: Any]]
                self.trailerKey = videos[0]["key"] as? String
            }
        }
        task.resume()
    }
    
    
    // Helper function to create an array of Movies from an array of dictionaries
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
    
}
