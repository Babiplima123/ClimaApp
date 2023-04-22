//
//  WheatherManager.swift
//  Clima
//
//  Created by Barbara Ann Pereira Lima on 16/04/23.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WheatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WheatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?lat=57&lon=-2.15&appid=94a29e0f6380fdd35d57468bfb9d018f&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        //1. Create a URL
        if let url = URL(string: urlString){
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                  if  let weather = self.parseJSON(safeData) {
                      self.delegate?.didUpdateWeather(self, weather: weather)
                      /*  let weatherVC = WeatherViewController()
                        weatherVC.didUpdateWeather(weather)
                        */
                    }
                }
            }
            //4. Start the ta
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
    let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodeData.weather[0].id
            let name = decodeData.name
            let temp = decodeData.main.temp
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
