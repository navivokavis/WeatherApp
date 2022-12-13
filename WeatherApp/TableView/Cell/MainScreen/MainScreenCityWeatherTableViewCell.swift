//
//  MainScreenCityWeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 12.12.22.
//

import UIKit

class MainScreenCityWeatherTableViewCell: UITableViewCell {
    
    static let identifier = "MainScreenCityWeatherTableViewCell"
    var time = UILabel()
    var cityLabel = UILabel()
    var weatherIcon = UIImageView()
    var temperatureLabel = UILabel()
   

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setup() {
        buildHierarchy()
        configureSubviews()
        layoutConstraint()
    }
    
    func buildHierarchy() {
        contentView.setupViews(time)
        contentView.setupViews(cityLabel)
        contentView.setupViews(weatherIcon)
        contentView.setupViews(temperatureLabel)
    }
    
    func configureSubviews() {
        contentView.backgroundColor = Resources.Colors.blackBackground
        
        time.textColor = Resources.Colors.whiteText
        time.font = Resources.Fonts.SFProDisplayRegular(with: 15)
        time.text = "15:55"
        
        cityLabel.textColor = Resources.Colors.whiteText
        cityLabel.font = Resources.Fonts.SFProDisplayMedium(with: 25)
        cityLabel.text = "Lissabon"
        
        weatherIcon.image = UIImage(systemName: "car")?.withRenderingMode(.alwaysTemplate)
        weatherIcon.contentMode = .scaleAspectFill
        
        temperatureLabel.textColor = Resources.Colors.whiteText
        temperatureLabel.font = Resources.Fonts.SFProDisplayThin(with: 50)
        temperatureLabel.text = "16"
        temperatureLabel.textAlignment = .right
    }
    
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
//            contentView.heightAnchor.constraint(equalToConstant: 50),
            
            time.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            time.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            cityLabel.topAnchor.constraint(equalTo: time.bottomAnchor, constant: 3),
            cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            temperatureLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            temperatureLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/3),
            
            weatherIcon.topAnchor.constraint(equalTo: contentView.topAnchor),
            weatherIcon.trailingAnchor.constraint(equalTo: temperatureLabel.leadingAnchor),
            weatherIcon.bottomAnchor.constraint(equalTo: temperatureLabel.bottomAnchor)
        ])
    }


    
}

    
