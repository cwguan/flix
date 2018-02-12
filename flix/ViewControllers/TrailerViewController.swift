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
    
    var trailerKey: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let trailerKey = trailerKey {
            let requestURLString = "https://www.youtube.com/watch?v=" + trailerKey
            let url = URL(string: requestURLString)!
            let request = URLRequest(url: url)
            trailerWebView.loadRequest(request)
        }

        // Do any additional setup after loading the view.
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
