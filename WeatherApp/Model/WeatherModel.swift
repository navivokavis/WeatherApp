//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 12.12.22.
//

import Foundation


// MARK: - DescriptionHeaderArray

let descriptionWeatherLabelTextArray: [String] = ["SUNRISE", "SUNSET", "CHANCE OF RAIN", "HUMIDITY", "WIND", "FEELS LIKE", "PRECIPITATION", "PRESSURE", "VISIBILITY", "UV INDEX"]


// MARK: - CityArray

let cityArray: [String] = ["Warsaw", "Bucharest", "Martuni","Shah Alam","Budapest","Munich","Netivot","Santa Cruz de la Sierra","Porto Alegre","Kfar Yona","Palermo","Bremen","Jermuk","Beit Shemesh","Florence","Utrecht","Buenos Aires","Guayaquil","Rosario","Soledad","Subang Jaya", "Valencia","Pasir Gudang", "Akhtala"]

var cityModelArray = [CityModel]()

// MARK: - CityModel

struct CityModel: Codable {
    let name: String
    let lat: Double
    let lon: Double
    
}

// MARK: - WeatherModel

struct WeatherModel: Codable {
    var timezone: String
    var current: Current
    var hourly: [Hourly]
    var daily: [Daily]
}

struct Current: Codable {
    var dt: Int
    var sunrise: Int
    var sunset: Int
    var temp: Double
    var feelsLike: Double
    var pressure: Int
    var humidity: Int
    var dewPint: Double
    var uvi: Double
    var clouds: Double
    var visibility: Double
    var windSpeed: Double
    var weather: [Weather]
    
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
    var id: Int
    var descriptionWeather: String
    var icon: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case descriptionWeather = "description"
        case icon
    }
}

struct Hourly: Codable {
    var dt: Int
    var temp: Double
    var humidity: Int
    var weather: [Weather]
    var pop: Double
    
}

struct Daily: Codable {
    
    var dt: Int
    var temp: Temp
    var humidity: Int
    var weather: [Weather]
    var pop: Double
    
}

struct Temp: Codable {
//    let day: Double
    var min: Double
    var max: Double
    var night: Double
}

