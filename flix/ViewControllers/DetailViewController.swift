//
//  DetailViewController.swift
//  flix
//
//  Created by Christopher Guan on 2/6/18.
//  Copyright © 2018 Christopher Guan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
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
            titleLabel.text = movie.title
            releaseDateLabel.text = movie.releaseDate
            overviewLabel.text = movie.overview
            
            backDropImageView.af_setImage(withURL: movie.backdropURL!)
            posterImageView.af_setImage(withURL: movie.posterURL!)
        }
        
        // Creates a tap recognizer fo tapping on movie poster
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(sender:)))
        posterImageView.isUserInteractionEnabled = true
        posterImageView.addGestureRecognizer(tapGestureRecognizer)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
