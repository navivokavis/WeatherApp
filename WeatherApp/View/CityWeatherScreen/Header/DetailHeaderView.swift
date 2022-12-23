//
//  DetailHeaderView.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 12.12.22.
//

import UIKit

class DetailHeaderView: UIView {
    
    var cityLabel = UILabel()
    var temperatureLabel = UILabel()
    var weatherDescriptionLabel = UILabel()
    var hightTempLabel = UILabel()
    var lowTempLabel = UILabel()
    var fullHeaderStackView = UIStackView()
    var lowAndHightTempStackView = UIStackView()
    var bottomSeparateView = UIView()
    var detailShortView = DetailShortHeaderView()
    var headerStackViewConstraint: NSLayoutConstraint!
    
    
    var isScroll: Bool = false
    var isFullView: Bool = true {
        didSet {
            switch isFullView {
            case true:
                UIView.animate(withDuration: 0.35) {
                    self.fullHeaderStackView.isHidden = false
                    self.detailShortView.isHidden = true
                    self.headerStackViewConstraint.constant = 250
//                    self.layoutIfNeeded()
                }
            case false:
                UIView.animate(withDuration: 0.35) {
                    self.fullHeaderStackView.isHidden = true
                    self.detailShortView.isHidden = false
                    self.headerStackViewConstraint.constant = 30
//                    self.layoutIfNeeded()
                }
            }
        }
    }
    
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
        
        isFullView = true
    }
    
    func buildHierarchy() {
        setupViews(detailShortView)
        setupViews(bottomSeparateView)
    }
    
    func configureSubviews() {
        backgroundColor = Resources.Colors.blueBackground
        
        lowAndHightTempStackView = UIStackView(arrangedSubviews: [hightTempLabel, lowTempLabel])
        fullHeaderStackView = UIStackView(arrangedSubviews: [cityLabel, temperatureLabel, weatherDescriptionLabel, lowAndHightTempStackView])
        setupViews(fullHeaderStackView)
        
        fullHeaderStackView.axis = .vertical
        fullHeaderStackView.alignment = .center
        fullHeaderStackView.spacing = 3
        
        lowAndHightTempStackView.axis = .horizontal
        lowAndHightTempStackView.spacing = 11
        lowAndHightTempStackView.distribution = .equalCentering
        
        cityLabel.font = Resources.Fonts.SFProDisplayRegular(with: 34)
        cityLabel.textColor = Resources.Colors.whiteText
        
        temperatureLabel.textColor = Resources.Colors.whiteText
        temperatureLabel.font = Resources.Fonts.SFProDisplayThin(with: 96)
        
        weatherDescriptionLabel.font = Resources.Fonts.SFProDisplayMedium(with: 20)
        weatherDescriptionLabel.textColor = Resources.Colors.whiteText
        weatherDescriptionLabel.adjustsFontSizeToFitWidth = true

        
        hightTempLabel.font = Resources.Fonts.SFProDisplayRegular(with: 20)
        hightTempLabel.textColor = Resources.Colors.whiteText
        
        lowTempLabel.font = Resources.Fonts.SFProDisplayRegular(with: 20)
        lowTempLabel.textColor = Resources.Colors.whiteText
        
        bottomSeparateView.backgroundColor = Resources.Colors.whiteBackground
        bottomSeparateView.alpha = 0.3
        
    }
    
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([

            fullHeaderStackView.topAnchor.constraint(equalTo: topAnchor, constant: 47),
            fullHeaderStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fullHeaderStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fullHeaderStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            
            detailShortView.topAnchor.constraint(equalTo: topAnchor, constant: 57),
            detailShortView.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailShortView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            detailShortView.heightAnchor.constraint(equalToConstant: 70)
            
            bottomSeparateView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            bottomSeparateView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bottomSeparateView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            bottomSeparateView.heightAnchor.constraint(equalToConstant: 1)
        ])
        headerStackViewConstraint = fullHeaderStackView.heightAnchor.constraint(equalToConstant: 250)
        headerStackViewConstraint.isActive = true
        
    }
    
    func setupcell(model: WeatherModel, cityName: String) {
        cityLabel.text = cityName
        temperatureLabel.text = "\(Int(model.current.temp))˚"
        weatherDescriptionLabel.text = model.current.weather[0].descriptionWeather
        hightTempLabel.text = "H:\(Int(model.daily[0].temp.max))˚"
        lowTempLabel.text = "L:\(Int(model.daily[0].temp.min))˚"
        detailShortView.setupcell(model: model, cityName: cityName)
    }
    
}
