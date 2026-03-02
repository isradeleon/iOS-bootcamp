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
    
    @IBAction func searchPressed(_ sender: UIButton) {
        executeCityWeatherSearch()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        executeCityWeatherSearch()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchField.text = ""
    }
    
    func executeCityWeatherSearch() {
        let city = searchField.text!
        
        // We close the keyboard & end editing.
        searchField.endEditing(true)
        
        // Here we would proceed with the weather logic
        print(city)
    }
}

