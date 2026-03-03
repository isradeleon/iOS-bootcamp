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
    
    let openWeatherManager = OpenWeatherManager()
    
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
        if let cityName = searchField.text {
            openWeatherManager.fetchWeather(city: cityName)
        }
        
        // We close the keyboard & end editing.
        searchField.endEditing(true)
    }
}

