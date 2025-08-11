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
        // print(URLString)
        performRequest(with: URLString)
    }
    
    func performRequest(with urlString: String){
        //1. create a url
        if let url = URL(string: urlString){
            //2. create a url session
            let session = URLSession(configuration: .default)
            //give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Error: \(error!.localizedDescription)")
                    return
                }
                if let safeData = data {
                    if let weatherData = String(data: safeData, encoding: .utf8) {
                        print(weatherData)
                    }
                }
            }
            //4. start the task
            task.resume()
        }
    }
}
