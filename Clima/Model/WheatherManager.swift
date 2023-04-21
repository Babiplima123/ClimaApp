//
//  WheatherManager.swift
//  Clima
//
//  Created by Barbara Ann Pereira Lima on 16/04/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WheatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?lat=57&lon=-2.15&appid=94a29e0f6380fdd35d57468bfb9d018f&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //1. Create a URL
        if let url = URL(string: urlString){
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            //4. Start the ta
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data){
    let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodeData.weather[0].id
            let name = decodeData.name
            let temp = decodeData.main.temp
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            print(weather.temperatureString)
        } catch {
            print(error)
        }
    }
    
}
