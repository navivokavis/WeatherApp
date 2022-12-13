//
//  APIManager.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 12.12.22.
//

import Foundation
import CoreLocation

class APIManager {
    
    static let shared = APIManager()
    
    private init() {}
    
    func getLocationCurrentWeatherURL(latitude: CLLocationDegrees, longitude: CLLocationDegrees) -> String {
        var components = URLComponents()
        components.scheme = OpenWeatherAPI.scheme
        components.host = OpenWeatherAPI.host
        components.path = OpenWeatherAPI.path + "/onecall"
        components.queryItems = [URLQueryItem(name: "lat", value: String(latitude)),
                                 URLQueryItem(name: "lon", value: String(longitude)),
                                 URLQueryItem(name: "exclude", value: "minutely"),
                                 URLQueryItem(name: "units", value: "metric"),
                                 URLQueryItem(name: "appid", value: OpenWeatherAPI.key)]
        guard let componentsString = components.string else { return "" }
        return componentsString
    }
    
}
