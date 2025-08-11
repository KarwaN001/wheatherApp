//
//  WeatherData.swift
//  wheatherApp
//
//  Created by karwan Syborg on 11/08/2025.
//

import UIKit

struct WeatherData: Decodable , Encodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
