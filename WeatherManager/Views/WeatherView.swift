//
//  WeatherView.swift
//  WeatherManager
//
//  Created by Fatmanur Şahin on 4.05.2025.
//

import SwiftUI

struct WeatherView: View {
    @State private var city: String = ""
    @ObservedObject var viewModel = WeatherViewModel()

    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter city name", text: $city)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

            Button(action: {
                viewModel.fetchWeather(for: city)
            }) {
                Text("Get Weather")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }

            if viewModel.isLoading {
                ProgressView("Loading...")
            }

            if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            }

            if let weather = viewModel.weather {
                VStack(alignment: .leading, spacing: 8) {
                    Text("City: \(weather.cityName)")
                    Text("Temperature: \(weather.temperature)")
                    Text("Description: \(weather.description)")
                    Text("Wind: \(weather.windSpeed)")
                    Text("Humidity: \(weather.humidity)")
                }
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(12)
                .padding(.horizontal)
            }

            Spacer()
        }
        .padding(.top)
    }
}
