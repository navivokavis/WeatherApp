//
//  DetailShortHeaderView.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 13.12.22.
//

import UIKit

class DetailShortHeaderView: UIView {
    
    var backButton = UIButton()
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
        setupViews(backButton)
        setupViews(cityLabel)
    }
    
    func configureSubviews() {
        backgroundColor = Resources.Colors.blueBackground

        backButton.setImage(Resources.Images.leftArrow, for: .normal)
        backButton.tintColor = Resources.Colors.whiteText
        
        descriptionWeatherStackView = UIStackView(arrangedSubviews: [temperatureLabel, separateView, weatherDescriptionLabel])
        descriptionWeatherStackView.axis = .horizontal
//        descriptionWeatherStackView.alignment = .firstBaseline
        descriptionWeatherStackView.distribution = .equalSpacing
        descriptionWeatherStackView.spacing = 10

        setupViews(descriptionWeatherStackView)

        
        cityLabel.text = "New York"
        cityLabel.font = Resources.Fonts.SFProDisplayRegular(with: 34)
        cityLabel.textColor = Resources.Colors.whiteText
        
        temperatureLabel.text = "7˚"
        temperatureLabel.textColor = Resources.Colors.whiteText
        temperatureLabel.font = Resources.Fonts.SFProDisplayMedium(with: 20)

        separateView.backgroundColor = Resources.Colors.whiteBackground
        
        weatherDescriptionLabel.text = "Cloudy Windy"
        weatherDescriptionLabel.font = Resources.Fonts.SFProDisplayMedium(with: 20)
        weatherDescriptionLabel.textColor = Resources.Colors.whiteText
        
//        addBackButtonAction(#selector(tap), with: self)
        
    }
    
//    @objc func tap() {
//        print("press")
//    }
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 53),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            cityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            cityLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor, constant: 3),

            separateView.widthAnchor.constraint(equalToConstant: 1),
            separateView.heightAnchor.constraint(equalToConstant: 24),

            descriptionWeatherStackView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 7),
            descriptionWeatherStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionWeatherStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 3/7),

        ])
    }
    
    
    
    func addBackButtonAction(_ action: Selector, with target: Any?) {
        backButton.addTarget(target, action: (action), for: .touchUpInside)
    }
    
    
    
}
