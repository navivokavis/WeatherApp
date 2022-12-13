//
//  DailyForecastTableViewCell.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 13.12.22.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {
    
    static let identifier = "DailyForecastTableViewCell"
    var dayLabel = UILabel()
    var weatherIcon = UIImageView()
    var humidityLabel = UILabel()
    var dayTempLabel = UILabel()
    var nightTempLabel = UILabel()


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
        contentView.setupViews(dayLabel)
        contentView.setupViews(weatherIcon)
        contentView.setupViews(humidityLabel)
        contentView.setupViews(dayTempLabel)
        contentView.setupViews(nightTempLabel)

    }
    
    func configureSubviews() {
        contentView.backgroundColor = Resources.Colors.blueBackground
        
        dayLabel.text = "Monday"
        dayLabel.font = Resources.Fonts.SFProDisplayRegular(with: 20)
        dayLabel.textColor = Resources.Colors.whiteText
        
        weatherIcon.image = UIImage(systemName: "car")?.withRenderingMode(.alwaysTemplate)
        weatherIcon.contentMode = .scaleAspectFill
        
        humidityLabel.text = "80%"
        humidityLabel.font = Resources.Fonts.SFProDisplayMedium(with: 13)
        humidityLabel.textColor = Resources.Colors.whiteText
        humidityLabel.alpha = 0.8
        
        dayTempLabel.text = "14"
        dayTempLabel.font = Resources.Fonts.SFProDisplayMedium(with: 20)
        dayTempLabel.textColor = Resources.Colors.whiteText
        
        nightTempLabel.text = "3"
        nightTempLabel.font = Resources.Fonts.SFProDisplayMedium(with: 20)
        nightTempLabel.textColor = Resources.Colors.whiteText
        
    }
    
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([

            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            dayLabel.widthAnchor.constraint(equalToConstant: 110),
            
            weatherIcon.centerYAnchor.constraint(equalTo: dayLabel.centerYAnchor),
            weatherIcon.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor, constant: 40),
            weatherIcon.heightAnchor.constraint(equalToConstant: 30),
            weatherIcon.widthAnchor.constraint(equalToConstant: 30),
            
            humidityLabel.centerYAnchor.constraint(equalTo: dayLabel.centerYAnchor),
            humidityLabel.leadingAnchor.constraint(equalTo: weatherIcon.trailingAnchor, constant: 10),
            
            dayTempLabel.centerYAnchor.constraint(equalTo: dayLabel.centerYAnchor),
            dayTempLabel.leadingAnchor.constraint(equalTo: humidityLabel.trailingAnchor, constant: 45),
            
            nightTempLabel.centerYAnchor.constraint(equalTo: dayLabel.centerYAnchor),
            nightTempLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }


    
}

    
