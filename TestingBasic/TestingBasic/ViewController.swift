//
//  ViewController.swift
//  TestingBasic
//
//  Created by Alfonso Miranda Castro on 28/09/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLabel: UILabel = {
      let label = UILabel()
      label.text = "Welcome"
      return label
    }()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNmeTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = "Alfonso"
    }
    
    @IBAction func composeFullNameAction() {
        if let name = nameTextField.text, let lastName = lastNmeTextField.text {
            self.nameLabel.text = "\(name.capitalized) \(lastName.capitalized)"
        }
    }
}

