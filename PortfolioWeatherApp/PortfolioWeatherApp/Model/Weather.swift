//
//  Weather.swift
//  PortfolioWeatherApp
//
//  Created by Anton Pogorelov on 20.05.2021.
//

import Foundation

struct Weather {
    
    var url: String = ""
    var name: String = ""
    var temperature: Int = 0
    var weatherIcon: String = ""
    var condition: String = ""
    var tempMin: Int = 0
    var tempMax: Int = 0
    
    var conditionString: String {
        switch condition {
        case "clear":                   return "Ясно"
        case "partly-cloudy":           return "Малооблачно"
        case "cloudy":                  return "Облачно с прояснениями"
        case "overcast":                return "Пасмурно"
        case "drizzle":                 return "Морось"
        case "light-rain":              return "Небольшой дождь"
        case "rain":                    return "Дождь"
        case "moderate-rain":           return "Умеренно сильный дождь"
        case "heavy-rain":              return "Сильный дождь"
        case "continuous-heavy-rain":   return "Длительный сильный дождь"
        case "showers":                 return "Ливень"
        case "wet-snow":                return "Дождь со снегом"
        case "light-snow":              return "Небольшой снег"
        case "snow":                    return "Снег"
        case "snow-showers":            return "Снегопад"
        case "hail":                    return "Град"
        case "thunderstorm":            return "Гроза"
        case "thunderstorm-with-rain":  return "Дождь с грозой"
        case "thunderstorm-with-hail":  return "Гроза с градом"
        default:                        return "Подождите..."
        }
    }
    
    init?(weatherData: WeatherData) {
        
        url = weatherData.info.url
        temperature = weatherData.fact.temp!
        weatherIcon = weatherData.fact.icon
        condition = weatherData.fact.condition
        tempMin = weatherData.forecasts.first!.parts.day.tempMin!
        tempMax = weatherData.forecasts.first!.parts.day.tempMax!
    }

    init() {
    }
    
}
