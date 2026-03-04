//
//  OpenWeatherManager.swift
//  Clima
//
//  Created by Israel Diaz de Leon on 03/03/26.
//  Copyright © 2026 App Brewery. All rights reserved.
//

import Foundation

struct OpenWeatherManager {
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather?units=metric"
    private let apiKey = "cdbf5d9374361aa56ac4c63e1e82d0d8"
    
    func fetchWeather(city: String) {
        let requestUrl = "\(baseUrl)&appid=\(apiKey)&q=\(city)"
        performRequest(urlString: requestUrl)
    }
    
    private func performRequest(urlString: String) {
        // 1. Create a URL object
        if let url = URL(string: urlString) {
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            // 3. Give the sessiona task
            // Passing a named method as parameter for dataTask
            // let task = session.dataTask(with: url, completionHandler: handler(data: response: error:))
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    // let dataString = String(data: safeData, encoding: .utf8)
                    // print(dataString!)
                    self.parseJSONData(data: safeData)
                }
            }
            
            // 4. Start task (call resume method since they're suspended by default)
            task.resume()
        }
    }
    
    private func parseJSONData(data: Data) {
        let jsonDecoder = JSONDecoder()
        do {
            let weatherData = try jsonDecoder.decode(WeatherData.self, from: data)
            print(weatherData.getConditionIcon())
        } catch {
            print(error)
        }
    }
    
    /* Old handler method for dataTask completion handler
    private func handler(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
    }
     */
}
