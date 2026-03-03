//
//  OpenWeatherManager.swift
//  Clima
//
//  Created by Israel Diaz de Leon on 03/03/26.
//  Copyright © 2026 App Brewery. All rights reserved.
//

struct OpenWeatherManager {
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather?units=metric"
    private let apiKey = "cdbf5d9374361aa56ac4c63e1e82d0d8"
    
    func fetchWeather(city: String) {
        let requestUrl = "\(baseUrl)&appid=\(apiKey)&q=\(city)"
    }
}
