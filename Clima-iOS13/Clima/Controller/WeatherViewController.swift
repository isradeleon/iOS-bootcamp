//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchField: UITextField!
    
    var openWeatherManager = OpenWeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchField.delegate = self
        openWeatherManager.delegate = self
        setupLocationManager()
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        executeCityWeatherSearch()
    }
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func executeCityWeatherSearch() {
        if let cityName = searchField.text {
            openWeatherManager.fetchWeather(city: cityName)
        }
        
        // We close the keyboard & end editing.
        searchField.endEditing(true)
    }
}

/**
 Using extensions for better organized protocol implementations:
 */

//MARK: - UITextFieldDelegate implementation
extension WeatherViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        executeCityWeatherSearch()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchField.text = ""
    }
}

//MARK: - OepnWeatherManagerDelegate implementation
extension WeatherViewController: OpenWeatherManagerDelegate {
    func onWeatherSearchSuccess(
        manager: OpenWeatherManager,
        weather: Weather
    ) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.formattedTemp
            self.cityLabel.text = weather.city
            self.conditionImageView.image = UIImage(
                systemName: weather.conditionIconName
            )
        }
    }
    
    func onWeatherSearchFailure(_ error: any Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate implementation
extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let mostRecentLocation = locations.last else { return }
        let coordinates = mostRecentLocation.coordinate
        openWeatherManager.fetchWeatherByCoordinates(
            lat: coordinates.latitude, lon: coordinates.longitude
        )
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
}
