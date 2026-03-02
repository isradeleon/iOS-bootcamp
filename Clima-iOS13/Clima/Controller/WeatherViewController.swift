//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        executeSearchFieldSearch()
        return true
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        executeSearchFieldSearch()
    }
    
    func executeSearchFieldSearch() {
        searchField.endEditing(true)
        let search = searchField.text
        print(search ?? "Empty field")
    }
    
}

