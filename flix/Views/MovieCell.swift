//
//  MovieCell.swift
//  flix
//
//  Created by Christopher Guan on 2/3/18.
//  Copyright © 2018 Christopher Guan. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie: Movie! {
        didSet {
            titleLabel.text = movie.title
            overviewLabel.text = movie.overview
            
            // Retrieves URL path to poster and displays it using Alamofire
            let posterURL = movie.posterURL!
            posterImageView.af_setImage(withURL: posterURL)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
