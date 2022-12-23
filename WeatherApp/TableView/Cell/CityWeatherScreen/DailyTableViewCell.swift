//
//  DailyTableViewCell.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 13.12.22.
//

import UIKit

class DailyTableViewCell: UITableViewCell {
    
    static let identifier = "DailyTableViewCell"
    var dayLabel = UILabel()
    var weatherIcon = UIImageView()
    var humidityLabel = UILabel()
    var highTempLabel = UILabel()
    var lowTempLabel = UILabel()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        
    }
   
    func setupcell(model: WeatherModel, indexPath: IndexPath) {
        let dailyModel = model.daily[indexPath.row]
        dayLabel.text = Date(timeIntervalSince1970: Double(dailyModel.dt)).getDayForDate()
        
        var urlString = "https://openweathermap.org/img/wn/\(dailyModel.weather[0].icon)@2x.png"
        weatherIcon.downloaded(from: urlString)
        humidityLabel.text = "\(dailyModel.humidity)%"
        highTempLabel.text = "\(Int(dailyModel.temp.max))˚"
        lowTempLabel.text = "\(Int(dailyModel.temp.min))˚"
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
        contentView.setupViews(dayLabel)
        contentView.setupViews(weatherIcon)
        contentView.setupViews(humidityLabel)
        contentView.setupViews(highTempLabel)
        contentView.setupViews(lowTempLabel)
        
    }
    
    func configureSubviews() {
        contentView.backgroundColor = Resources.Colors.blueBackground
        
        dayLabel.font = Resources.Fonts.SFProDisplayRegular(with: 20)
        dayLabel.textColor = Resources.Colors.whiteText
        
        weatherIcon.contentMode = .scaleAspectFill
        
        humidityLabel.font = Resources.Fonts.SFProDisplayMedium(with: 13)
        humidityLabel.textColor = Resources.Colors.whiteText
        humidityLabel.alpha = 0.8
        
        highTempLabel.font = Resources.Fonts.SFProDisplayMedium(with: 20)
        highTempLabel.textColor = Resources.Colors.whiteText
        
        lowTempLabel.font = Resources.Fonts.SFProDisplayMedium(with: 20)
        lowTempLabel.textColor = Resources.Colors.whiteText.withAlphaComponent(0.5)
        
    }
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalToConstant: 400),
            contentView.heightAnchor.constraint(equalToConstant: 400),
            
            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            dayLabel.widthAnchor.constraint(equalToConstant: 110),
            
            weatherIcon.centerYAnchor.constraint(equalTo: dayLabel.centerYAnchor),
            weatherIcon.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor, constant: 40),
            weatherIcon.heightAnchor.constraint(equalToConstant: 30),
            weatherIcon.widthAnchor.constraint(equalToConstant: 30),
            
            humidityLabel.centerYAnchor.constraint(equalTo: dayLabel.centerYAnchor),
            humidityLabel.leadingAnchor.constraint(equalTo: weatherIcon.trailingAnchor, constant: 10),
            
            highTempLabel.centerYAnchor.constraint(equalTo: dayLabel.centerYAnchor),
            highTempLabel.leadingAnchor.constraint(equalTo: humidityLabel.trailingAnchor, constant: 45),
            
            lowTempLabel.centerYAnchor.constraint(equalTo: dayLabel.centerYAnchor),
            lowTempLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
    
    
    
}


