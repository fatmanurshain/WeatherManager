
import Foundation
import CoreLocation

class WeatherManager {
    let apiKey = "70eb06572171be63d1f4aec048378ed6"

    func fetchWeather(forCity city: String, completion: @escaping (Result<WeatherModel, Error>) -> Void) {
        // Şehre göre URL oluştur
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"

        guard let url = URL(string: urlString) else {
            print("❌ Geçersiz URL")
            return
        }

        // URL üzerinden veri çek
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                print("❌ Veri yok")
                return
            }

            // JSON decode
            do {
                let decodedData = try JSONDecoder().decode(WeatherResponse.self, from: data)
                let weather = WeatherModel(response: decodedData)
                completion(.success(weather))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
