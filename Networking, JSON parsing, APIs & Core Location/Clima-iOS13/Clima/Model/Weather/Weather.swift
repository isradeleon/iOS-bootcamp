//
//  Weather.swift
//  Clima
//
//  Created by Israel Diaz de Leon on 04/03/26.
//  Copyright © 2026 App Brewery. All rights reserved.
//

struct Weather {
    let city: String
    let description: String
    let temp: Float
    let condition: Condition
    
    /**
     Computed properties are "called" or computed at run time. This makes
     them work similarly to a function.
     */
    var formattedTemp: String {
        String(format: "%.1f", temp)
    }
    
    var conditionIconName: String {
        switch condition {
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
