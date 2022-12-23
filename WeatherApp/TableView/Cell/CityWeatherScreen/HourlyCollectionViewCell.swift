//
//  HourlyCollectionViewCell.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 12.12.22.
//

import UIKit

final class HourlyCollectionViewCell: UICollectionViewCell {
    
    var tempLabel = UILabel()
    var timeLabel = UILabel()
    var iconImageView = UIImageView()
    
    static let identifier = "HourlyCollectionViewCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setup() {
        buildHierarchy()
        configureSubviews()
        layoutConstraint()
    }
    
    func buildHierarchy() {
        setupViews(tempLabel)
        setupViews(timeLabel)
        setupViews(iconImageView)
    }
    
    func configureSubviews() {
        timeLabel.textColor = Resources.Colors.whiteText
        timeLabel.font = Resources.Fonts.SFProDisplayBold(with: 15)
        
        tempLabel.textColor = Resources.Colors.whiteText
        tempLabel.font = Resources.Fonts.SFProDisplayBold(with: 20)
    }
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            iconImageView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 9),
            iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),

            tempLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 8),
            tempLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    
    func setupcell(model: WeatherModel, indexPath: IndexPath) {
        let hourlyModel = model.hourly[indexPath.row]
        
        let hourForDate = Date(timeIntervalSince1970: Double(hourlyModel.dt)).getHourForDate()
        let nextHourForDate = Date(timeIntervalSince1970: Double(model.hourly[indexPath.row + 1].dt)).getTimeForDate()
        let timeForDate = Date(timeIntervalSince1970: Double(hourlyModel.dt)).getTimeForDate()
        let sunset = Date(timeIntervalSince1970: Double(model.current.sunset)).getTimeForDate()
        let sunrise = Date(timeIntervalSince1970: Double(model.current.sunrise)).getTimeForDate()
        
        if indexPath.row == 0 {
            timeLabel.text = "Now"
        } else {
            if sunset >= timeForDate && sunset < nextHourForDate {
                timeLabel.text = "Sunset"
            } else if sunrise >= timeForDate && sunrise < nextHourForDate {
                timeLabel.text = "Sunrise"
            } else {
                timeLabel.text = hourForDate
            }
        }
        
        var urlString = "https://openweathermap.org/img/wn/\(hourlyModel.weather[0].icon)@2x.png"
        iconImageView.downloaded(from: urlString)
        
        tempLabel.text = "\(Int(hourlyModel.temp))˚"
    }
    
}

