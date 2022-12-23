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
    var apiKey = "da2798e7e8c96956caff9ac80cce3ebe"
    var secondApiKey = "435d1f427f31db9da38c9350c88e96af"
    private init() {}

    func fetchLocationFromCity(city: String, success: @escaping(_ cities: CityModel?) -> ()) {
        
        var urlString = "https://api.openweathermap.org/geo/1.0/direct?q=\(city.split(separator: " ").joined(separator: "%20"))&limit=1&appid=\(secondApiKey)"
        
//        guard let urlString = urlString else { return }
        
        let urlSession = URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else { return }
            
            var json: [CityModel]?
            do {
                json = try JSONDecoder().decode([CityModel].self, from: data)
                success(json?.first)
            }
            catch {
                print("error: \(error)" )
            }
            
            guard let result = json else { return }
            print("result - \(result)")
            
        }).resume()
    }

    func fetchCurrentWeather(lat: String, lon: String, success: @escaping(_ weather: WeatherModel?) -> ()) {
        
        var urlString = "https://api.openweathermap.org/data/2.8/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&units=metric&appid=\(apiKey)"
        
        let urlSession = URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else { return }
            
            var json: WeatherModel?
            do {
                json = try JSONDecoder().decode(WeatherModel.self, from: data)
                success(json)
            }
            catch {
                print("error: \(error)" )
            }
            
            guard let result = json else { return }
                        
        }).resume()
    }
    
    
    
}


