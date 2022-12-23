//
//  MainScreenCityWeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 12.12.22.
//

import UIKit

class MainScreenCityWeatherTableViewCell: UITableViewCell {
    
    static let identifier = "MainScreenCityWeatherTableViewCell"
    var timeLabel = UILabel()
    var cityLabel = UILabel()
    var weatherIcon = UIImageView()
    var temperatureLabel = UILabel()
   
    var weatherModel: WeatherModel?

//    override func prepareForReuse() {
//        super.prepareForReuse()
//        cityLabel.text = ""
//        timeLabel.text = ""
//        temperatureLabel.text = ""
//        weatherIcon.image = nil
//    }
    
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
        contentView.setupViews(timeLabel)
        contentView.setupViews(cityLabel)
        contentView.setupViews(weatherIcon)
        contentView.setupViews(temperatureLabel)
    }
    
    func configureSubviews() {
        contentView.backgroundColor = Resources.Colors.blackBackground
        
        timeLabel.textColor = Resources.Colors.whiteText
        timeLabel.font = Resources.Fonts.SFProDisplayRegular(with: 15)
        
        cityLabel.textColor = Resources.Colors.whiteText
        cityLabel.font = Resources.Fonts.SFProDisplayMedium(with: 25)
        cityLabel.numberOfLines = 0
//        cityLabel.adjustsFontSizeToFitWidth = true
        
        weatherIcon.contentMode = .scaleAspectFill
        
        temperatureLabel.textColor = Resources.Colors.whiteText
        temperatureLabel.font = Resources.Fonts.SFProDisplayThin(with: 50)
        temperatureLabel.textAlignment = .right
    }
    
    
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            timeLabel.heightAnchor.constraint(equalToConstant: 18),
            
            cityLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 3),
            cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            cityLabel.widthAnchor.constraint(equalToConstant: 160),
            
            temperatureLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            temperatureLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/3),
            
            weatherIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            weatherIcon.trailingAnchor.constraint(equalTo: temperatureLabel.leadingAnchor),
            weatherIcon.bottomAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            weatherIcon.heightAnchor.constraint(equalToConstant: 60),
            weatherIcon.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func urlRequest(model: CityModel) {
        cityLabel.text = model.name
        APIManager.shared.fetchCurrentWeather(lat: "\(model.lat)", lon: "\(model.lon)", success: {
            [weak self] weather in
            guard let weather = weather else { return }
            DispatchQueue.main.async {
                self?.temperatureLabel.text = "\(Int(weather.current.temp))˚"
                
                // get hour with timezone
                var unixDate = Date(timeIntervalSince1970: TimeInterval(weather.current.dt))
                let timeZone = TimeZone(identifier: weather.timezone)
                guard let timeZone = timeZone else { return }
                let dateFormatter = DateFormatter()
                dateFormatter.timeZone = timeZone
                dateFormatter.dateFormat = "HH:mm"
                let dateString = dateFormatter.string(from: unixDate)
                self?.timeLabel.text = dateString
                
                let urlString = "https://openweathermap.org/img/wn/\(weather.current.weather[0].icon)@2x.png"
                self?.weatherIcon.downloaded(from: urlString)
                
            }
            
        })
    }

}

    
