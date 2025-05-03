//
//  WeatherResponse.swift
//  WeatherManager
//
//  Created by Fatmanur Şahin on 4.05.2025.
//

import Foundation

struct WeatherResponse: Decodable {
    let name : String
    let main: WeatherMain
    let weather: [Weather]
    let wind: Wind
}

struct WeatherMain: Decodable {
    let temp: Double
    let humidity: Int
}

struct Weather: Decodable {
    let description: String
    let icon: String
}

struct Wind: Decodable {
    let speed: Double
}
