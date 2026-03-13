//
//  OpenWeatherManagerDelegate.swift
//  Clima
//
//  Created by Israel Diaz de Leon on 04/03/26.
//  Copyright © 2026 App Brewery. All rights reserved.
//

protocol OpenWeatherManagerDelegate {
    func onWeatherSearchSuccess(manager: OpenWeatherManager, weather: Weather)
    func onWeatherSearchFailure(_ error: Error)
}
