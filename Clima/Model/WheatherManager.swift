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
        print(urlString)
    }
}
