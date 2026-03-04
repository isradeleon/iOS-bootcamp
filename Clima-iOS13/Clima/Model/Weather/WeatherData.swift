//
//  WeatherData.swift
//  Clima
//
//  Created by Israel Diaz de Leon on 03/03/26.
//  Copyright © 2026 App Brewery. All rights reserved.
//

struct WeatherData: Decodable {
    let name: String
    let main: MainData
    let weather: [WeatherCondition]
    
    func getConditionIcon() -> String {
        let condition = weather[0].main
        return switch condition {
            case .Thunderstorm: "cloud.bolt.rain"
            case .Drizzle: "cloud.drizzle"
            case .Rain: "cloud.rain"
            case .Snow: "cloud.snow"
            case .Mist, .Smoke, .Haze, .Sand,
                    .Dust, .Fog, .Ash: "cloud.smoke"
            case .Squall: "wind"
            case .Tornado: "tornado"
            case .Clear: "sun.max"
            case .Clouds: "cloud"
        }
    }
}
