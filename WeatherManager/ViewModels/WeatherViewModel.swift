//
//  WeatherViewModel.swift
//  WeatherManager
//
//  Created by Fatmanur Şahin on 4.05.2025.
//

import Foundation

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
}
