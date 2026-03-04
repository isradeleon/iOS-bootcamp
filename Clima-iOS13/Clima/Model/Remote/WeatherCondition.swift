//
//  WeatherCondition.swift
//  Clima
//
//  Created by Israel Diaz de Leon on 03/03/26.
//  Copyright © 2026 App Brewery. All rights reserved.
//

struct WeatherCondition: Decodable {
    let main: Condition?
    let description: String?
}
