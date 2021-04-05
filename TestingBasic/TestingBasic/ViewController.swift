//
//  ViewController.swift
//  TestingBasic
//
//  Created by Alfonso Miranda Castro on 28/09/2019.
//  Copyright © 2019 alfonsomiranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLabel: UILabel = {
      let label = UILabel()
      label.text = "Welcome"
      return label
    }()
    
    var movieProvider: MovieProvider = MovieProviderImplementation()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNmeTextField: UITextField!
    @IBOutlet weak var titleMovieLabel: UILabel!
    @IBOutlet weak var descriptionMovieLabel: UILabel!
    @IBOutlet weak var getMovieButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = "Alfonso"
    }
    
    @IBAction func composeFullNameAction() {
        if let name = nameTextField.text, let lastName = lastNmeTextField.text {
            self.nameLabel.text = "\(name.capitalized) \(lastName.capitalized)"
        }
    }
    
    @IBAction func getBestMovie() {
        movieProvider.getMovie(success: { (movie) in
            self.titleMovieLabel.text = movie.title
            self.descriptionMovieLabel.text = movie.movieEntityDescription
        }) { (error) in
            debugPrint("Error")
        }
    }
}

