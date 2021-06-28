//
//  WeatherData.swift
//  PortfolioWeatherApp
//
//  Created by Anton Pogorelov on 20.05.2021.
//

import Foundation

struct WeatherData: Decodable {
    let info: Info
    let fact: Fact
    let forecasts: [Forecast]
}

struct Info: Decodable {
    let url: String
}

struct Fact: Decodable {
    let temp: Int?
    let icon: String
    let condition: String
    let tempMin: Int?
    let tempMax: Int?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case icon
        case condition
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

struct Forecast: Decodable {
    let parts: Parts
}

struct Parts: Decodable {
    let day: Fact
    
    enum CodingKeys: String, CodingKey {
        case day
    }
}
