//
//  DetailShortHeaderView.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 13.12.22.
//

import UIKit

class DetailShortHeaderView: UIView {
    
    var cityLabel = UILabel()
    var temperatureLabel = UILabel()
    var weatherDescriptionLabel = UILabel()
    var separateView = UIView()
    var descriptionWeatherStackView = UIStackView()
    
    var headerStackViewConstraint: NSLayoutConstraint!

    
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
        setupViews(cityLabel)
    }
    
    func configureSubviews() {
        backgroundColor = Resources.Colors.blueBackground
        
        descriptionWeatherStackView = UIStackView(arrangedSubviews: [temperatureLabel, separateView, weatherDescriptionLabel])
        descriptionWeatherStackView.axis = .horizontal
        descriptionWeatherStackView.distribution = .equalSpacing
        descriptionWeatherStackView.spacing = 10

        setupViews(descriptionWeatherStackView)

        cityLabel.font = Resources.Fonts.SFProDisplayRegular(with: 34)
        cityLabel.textColor = Resources.Colors.whiteText
        
        temperatureLabel.textColor = Resources.Colors.whiteText
        temperatureLabel.font = Resources.Fonts.SFProDisplayMedium(with: 20)

        separateView.backgroundColor = Resources.Colors.whiteBackground
        
        weatherDescriptionLabel.font = Resources.Fonts.SFProDisplayMedium(with: 20)
        weatherDescriptionLabel.textColor = Resources.Colors.whiteText
        weatherDescriptionLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
  
            cityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            cityLabel.topAnchor.constraint(equalTo: topAnchor),

            separateView.widthAnchor.constraint(equalToConstant: 1),
            separateView.heightAnchor.constraint(equalToConstant: 24),

            descriptionWeatherStackView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 7),
            descriptionWeatherStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionWeatherStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 3/7),

        ])
    }
    
    func setupcell(model: WeatherModel, cityName: String) {
        cityLabel.text = cityName
        temperatureLabel.text = "\(Int(model.current.temp))˚"
        weatherDescriptionLabel.text = model.current.weather[0].descriptionWeather
        
    }
    
}
