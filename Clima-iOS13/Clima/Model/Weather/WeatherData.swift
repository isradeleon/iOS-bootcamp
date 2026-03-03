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
}
