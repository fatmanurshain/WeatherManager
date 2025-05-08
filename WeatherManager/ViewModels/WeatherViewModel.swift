//
//  WeatherViewModel.swift
//  WeatherManager
//
//  Created by Fatmanur Şahin on 4.05.2025.
//

import Foundation
import SwiftUICore

class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherModel?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let weatherManager = WeatherManager()

    func fetchWeather(for city: String) {
        isLoading = true
        errorMessage = nil

        weatherManager.fetchWeather(forCity: city) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let weatherModel):
                    self?.weather = weatherModel
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    var backgroundColor: Color {
        guard let description = weather?.description.lowercased() else {
            return Color.gray
        }

        if description.contains("clear") {
            return Color.blue
        } else if description.contains("cloud") {
            return Color.cyan
        } else if description.contains("rain") || description.contains("drizzle") {
            return Color.blue.opacity(0.5)
        } else if description.contains("snow") {
            return Color.white
        } else {
            return Color.gray
        }
    }


}
