//
//  WeatherModel.swift
//  WeatherManager
//
//  Created by Fatmanur Şahin on 4.05.2025.
//

import Foundation

struct WeatherModel {
    let cityName: String
    let temperature: String
    let description: String
    let iconName: String
    let windSpeed: String
    let humidity: String

    init(response: WeatherResponse) {
        self.cityName = response.name
        self.temperature = String(format: "%.1f°C", response.main.temp)
        self.description = response.weather.first?.description.capitalized ?? "N/A"
        self.iconName = response.weather.first?.icon ?? "01d"
        self.windSpeed = "\(response.wind.speed) m/s"
        self.humidity = "\(response.main.humidity)%"
    }
}
