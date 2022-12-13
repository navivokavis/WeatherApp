//
//  DataFetcherService.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 12.12.22.
//

import Foundation
import CoreLocation

class DataFetcherService {
    
    var networkDataFetcher: DataFetcher = NetworkDataFetcher()
    
    func fetchWeatherData (latitude: CLLocationDegrees, longitude: CLLocationDegrees, completion: @escaping (WeatherModel?) -> Void) {
        let urlString = APIManager.shared.getLocationCurrentWeatherURL(latitude: latitude, longitude: longitude)
        print(urlString)
        networkDataFetcher.fetchData(urlString: urlString, completion: completion)
    }
    
}
