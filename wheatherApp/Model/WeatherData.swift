//
//  WeatherData.swift
//  wheatherApp
//
//  Created by karwan Syborg on 11/08/2025.
//

import UIKit

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    let id: Int
}
