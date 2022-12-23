//
//  CityWeatherTableViewSection.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 16.12.22.
//

import UIKit

enum CityWeatherTableViewSection: Int {
    
    static let numberOfSection = 4
    
    case hourly = 0
    case daily = 1
    case information = 2
    case description = 3
    
    init?(sectionIndex: Int) {
        guard let section = CityWeatherTableViewSection(rawValue: sectionIndex) else { return nil }
        self = section
    }
    
    var cellHeight: CGFloat {
        switch self {
        case .hourly:
            return CGFloat(120)
        case .daily:
            return CGFloat(50)
        case .information:
            return CGFloat(60)
        case .description:
            return CGFloat(60)
        }
    }
    
    
}
