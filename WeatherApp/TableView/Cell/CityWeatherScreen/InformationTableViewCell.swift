//
//  InformationTableViewCell.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 18.12.22.
//

import UIKit

class InformationTableViewCell: UITableViewCell {

    var informetionWeatherLabel = UILabel()
    var topSeparateView = UIView()
//    var bottomSeparateView = UIView()
    
    var weatherModel: WeatherModel?
    static var identifier = "InformationTableViewCell"
    
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
        contentView.setupViews(informetionWeatherLabel)
        contentView.setupViews(topSeparateView)
//        contentView.setupViews(bottomSeparateView)
    }
    
    func configureSubviews() {
        contentView.backgroundColor = Resources.Colors.blueBackground
        
        selectionStyle = .none
        
        informetionWeatherLabel.numberOfLines = 0
        informetionWeatherLabel.font = Resources.Fonts.SFProDisplayRegular(with: 17)
        informetionWeatherLabel.textColor = Resources.Colors.whiteText
        
        topSeparateView.backgroundColor = Resources.Colors.whiteBackground
        topSeparateView.alpha = 0.3
        
//        bottomSeparateView.backgroundColor = Resources.Colors.whiteBackground
//        bottomSeparateView.alpha = 0.3
    }
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
            topSeparateView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            topSeparateView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            topSeparateView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            topSeparateView.heightAnchor.constraint(equalToConstant: 1),

            informetionWeatherLabel.topAnchor.constraint(equalTo: topSeparateView.topAnchor, constant: 10),
            informetionWeatherLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            informetionWeatherLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
//            bottomSeparateView.topAnchor.constraint(equalTo: informetionWeatherLabel.bottomAnchor, constant: 11),
//            bottomSeparateView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            bottomSeparateView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            bottomSeparateView.heightAnchor.constraint(equalToConstant: 1)

        ])
    }

    
    func setupcell(model: WeatherModel, indexPath: IndexPath) {
        informetionWeatherLabel.text = model.current.weather[indexPath.row].descriptionWeather
    }
}



