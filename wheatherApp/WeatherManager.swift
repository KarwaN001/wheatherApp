//
//  WeatherManager.swift
//  wheatherApp
//
//  Created by karwan Syborg on 10/08/2025.
//

import Foundation

struct WeatherManager {
    let WheatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=a89bad3a6d3f947a4faaad85523560da&units=metric"
    
    func fetchWheather(_ cityName: String){
        let URLString = "\(WheatherURL)&q=\(cityName)"
        print(URLString)
    }
    
}
