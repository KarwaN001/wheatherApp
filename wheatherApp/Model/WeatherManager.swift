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
                    if let weather = self.parseJSON(safeData) {
                        
                        
                        //test test test test 
                        // var testWeatherVC = ViewController()
                        // testWeatherVC.test(weather: weather)
                    }
                }
            }
            //4. start the task
            task.resume()
        }
    }

    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let temp = decodedData.main.temp
            let description = decodedData.weather[0].description
            
            let weather = WeatherModel(conditionId: id, cityName: name, description: description, temperature: temp)
            
            //print(temp, name, description, weather.conditionName , id)
            return weather
        } catch {
            print(error)
            return nil
        }
    }

    
}
