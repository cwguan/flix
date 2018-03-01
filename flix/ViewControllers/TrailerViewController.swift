//
//  TrailerViewController.swift
//  flix
//
//  Created by Christopher Guan on 2/11/18.
//  Copyright © 2018 Christopher Guan. All rights reserved.
//

import UIKit

class TrailerViewController: UIViewController {

    @IBOutlet weak var trailerWebView: UIWebView!
    
    var trailerKeyURL: String!
    
    @IBAction func didPressDone(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let trailerKeyURL = trailerKeyURL {
            let requestURLString = "https://www.youtube.com/watch?v=" + trailerKeyURL
            let url = URL(string: requestURLString)!
            let request = URLRequest(url: url)
            trailerWebView.loadRequest(request)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
