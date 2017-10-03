//
//  ViewController.swift
//  API-Sandbox
//
//  Created by Dion Larson on 6/24/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage
import AlamofireNetworkActivityIndicator

class ViewController: UIViewController {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var rightsOwnerLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        
//        exerciseOne()
//        exerciseTwo()
//        exerciseThree()
     
        
        let apiToContact = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        // This code will call the iTunes top 25 movies endpoint listed above
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let allMoviesData = json["feed"]["entry"].arrayValue
                    var allMovies: [Movie] = []
                    for movie in allMoviesData {
                        let newMovie = Movie(json: movie)
                        allMovies.append(newMovie)
                    }
                    let numbers = Int(arc4random_uniform(24))
                    // Do what you need to with JSON here!
                    // The rest is all boiler plate code you'll use for API requests
                    let randomMovie = allMovies[numbers]
                    self.movieTitleLabel.text = randomMovie.name
                    self.rightsOwnerLabel.text = randomMovie.rightsOwner
                    self.releaseDateLabel.text = randomMovie.releaseDate
                    self.priceLabel.text = "$ \(randomMovie.price)"
                    self.loadPoster(urlString: randomMovie.poster)
//                    self.viewOniTunesPressed(randomMovie.link as AnyObject)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Updates the image view when passed a url string
    func loadPoster(urlString: String) {
        posterImageView.af_setImage(withURL: URL(string: urlString)!)
    }
    
    @IBAction func viewOniTunesPressed(_ sender: AnyObject) {
        
        UIApplication.shared.openURL(URL(string: "//www.apple.com/itunes/")!)
    }
    
}
