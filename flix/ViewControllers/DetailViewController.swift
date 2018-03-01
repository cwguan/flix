//
//  DetailViewController.swift
//  flix
//
//  Created by Christopher Guan on 2/6/18.
//  Copyright © 2018 Christopher Guan. All rights reserved.
//

import UIKit

enum MovieKeys {
    static let title = "title"
    static let backdropPath = "backdrop_path"
    static let posterPath = "poster_path"
}

class DetailViewController: UIViewController {

    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    //var movie: [String: Any]?
    var trailerKey: String!
    var movie: Movie?

    
    // didTap function to initiate segue to the UIWebView for trailer
    @objc func didTap(sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "trailerSegue", sender: nil)
    }
    
    // Passes trailer key prior to segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! TrailerViewController
        destinationViewController.trailerKeyURL = movie?.trailerKey
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Populate various labels and images on DetailView
        if let movie = movie {
            titleLabel.text = movie.title as? String
            releaseDateLabel.text = movie.releaseDate as? String
            overviewLabel.text = movie.overview as? String
            
            //let backdropPathString = movie[MovieKeys.backdropPath] as! String
            //let posterPathString = movie[MovieKeys.posterPath] as! String
            //let baseURLString = "https://image.tmdb.org/t/p/w500"
            
            //let backdropURL = URL(string: baseURLString + backdropPathString)!
            backDropImageView.af_setImage(withURL: movie.backdropURL!)
            
            //let posterPathURL = URL(string: baseURLString + posterPathString)!
            posterImageView.af_setImage(withURL: movie.posterURL!)
        }
        
        // Creates a tap recognizer fo tapping on movie poster
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(sender:)))
        posterImageView.isUserInteractionEnabled = true
        posterImageView.addGestureRecognizer(tapGestureRecognizer)
        
        // Performs network request for the trailer URL from movie database
//        if let movie = movie {
//            let movieID = String(format: "%@", movie.id as! CVarArg)
//            let requestURLString = "https://api.themoviedb.org/3/movie/" + movieID + "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US"
//            let url = URL(string: requestURLString)!
//            let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
//            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
//            let task = session.dataTask(with: request) { (data, response, error) in
//                // This will run when the network request returns
//                if let error = error {
//                    print(error.localizedDescription)
//                } else if let data = data {
//                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//                    let videos = dataDictionary["results"] as! [[String: Any]]
//                    self.trailerKey = videos[0]["key"] as? String
//                    print(self.trailerKey)
//                }
//            }
//            task.resume()
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
