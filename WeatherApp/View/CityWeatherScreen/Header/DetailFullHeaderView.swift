//
//  DetailFullHeaderView.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 12.12.22.
//

import UIKit

class DetailFullHeaderView: UIView {
    
    var backButton = UIButton()
    var cityLabel = UILabel()
    var temperatureLabel = UILabel()
    var weatherDescriptionLabel = UILabel()
    var hightTempLabel = UILabel()
    var lowTempLabel = UILabel()
    var headerStackView = UIStackView()
    var lowAndHightTempStackView = UIStackView()
    
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

    }
    
    func configureSubviews() {
        backgroundColor = Resources.Colors.blueBackground

        backButton.setImage(Resources.Images.leftArrow, for: .normal)
        backButton.tintColor = Resources.Colors.whiteText
        
        lowAndHightTempStackView = UIStackView(arrangedSubviews: [hightTempLabel, lowTempLabel])
        headerStackView = UIStackView(arrangedSubviews: [cityLabel, temperatureLabel, weatherDescriptionLabel, lowAndHightTempStackView])
        setupViews(headerStackView)
        
        headerStackView.axis = .vertical
        headerStackView.alignment = .center
        headerStackView.spacing = 3
        
        lowAndHightTempStackView.axis = .horizontal
        lowAndHightTempStackView.spacing = 11
        lowAndHightTempStackView.distribution = .equalCentering
        
        cityLabel.text = "New York"
        cityLabel.font = Resources.Fonts.SFProDisplayRegular(with: 34)
        cityLabel.textColor = Resources.Colors.whiteText
        
        temperatureLabel.text = "7˚"
        temperatureLabel.textColor = Resources.Colors.whiteText
        temperatureLabel.font = Resources.Fonts.SFProDisplayThin(with: 96)
        
        weatherDescriptionLabel.text = "Cloudy Windy"
        weatherDescriptionLabel.font = Resources.Fonts.SFProDisplayMedium(with: 20)
        weatherDescriptionLabel.textColor = Resources.Colors.whiteText
        
        hightTempLabel.text = "H:9˚"
        hightTempLabel.font = Resources.Fonts.SFProDisplayRegular(with: 20)
        hightTempLabel.textColor = Resources.Colors.whiteText
        
        lowTempLabel.text = "L:0˚"
        lowTempLabel.font = Resources.Fonts.SFProDisplayRegular(with: 20)
        lowTempLabel.textColor = Resources.Colors.whiteText
        
//        addBackButtonAction(#selector(tap), with: self)
        

        
    }
    
//    @objc func tap() {
//        print("press")
//    }
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 53),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            headerStackView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 7),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 3/5)

        ])
    
    }
    
    
    
    func addBackButtonAction(_ action: Selector, with target: Any?) {
        backButton.addTarget(target, action: (action), for: .touchUpInside)
    }
    
    
    
}
