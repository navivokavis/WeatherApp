//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 12.12.22.
//

import Foundation

// MARK: - CityArray

let cityArray: [String] = ["Warsaw","Bucharest","Martuni","Shah Alam","Karmie","Budapest","Munich","Netivot","Santa Cruz de la Sierra","Porto Alegre","Kfar Yona","Palermo","Bremen","Jermuk","Beit Shemesh","Florence","Utrecht","Buenos Aires","Guayaquil","Rosario","Soledad","Subang Jaya","Valencia","Pasir Gudang","Akhtala"]

// MARK: - WeatherModel

struct WeatherModel: Codable {
    let timezone: String
    let current: Current
    let hourly: [Hourly]
    let daily: [Daily]
}

struct Current: Codable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: Double
    let feelsLike: Double
    let pressure: Int
    let humidity: Int
    let dewPint: Double
    let uvi: Double
    let clouds: Double
    let visibility: Double
    let windSpeed: Double
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case dt
        case sunrise
        case sunset
        case temp
        case feelsLike = "feels_like"
        case pressure
        case humidity
        case dewPint = "dew_point"
        case uvi
        case clouds
        case visibility
        case windSpeed = "wind_speed"
        case weather
    }
    
}

struct Weather: Codable {
    let id: Int
    let descriptionWeather: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case descriptionWeather = "description"
        case icon
    }
}

struct Hourly: Codable {
    let dt: Int
    let temp: Double
    let humidity: Int
    let weather: [Weather]
    let pop: Double
    
}

struct Daily: Codable {
    
    let dt: Int
    let temp: Temp
    let humidity: Int
    let weather: [Weather]
    let pop: Double
    
}

struct Temp: Codable {
    let min: Double
    let max: Double
    let night: Double
}

// MARK: - DescriptionHeaderArray

let descriptionArray = ["SUNRISE",
                        "SUNSET",
                        "HUMIDITY",
                        "WIND",
                        "FEELS LIKE",
                        "RESSURE",
                        "VISIBILITY",
                        "UV INDEX"]
