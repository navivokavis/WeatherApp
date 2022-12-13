//
//  DailyParametrsFirstTableViewCell.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 13.12.22.
//

import UIKit

class DailyParametrsFirstTableViewCell: UITableViewCell {
    
    static let identifier = "DailyParametrsFirstTableViewCell"
    var descriptionWeatherLabel = UILabel()
    var topSeparateView = UIView()
    var bottomSeparateView = UIView()
    
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
        contentView.setupViews(descriptionWeatherLabel)
        contentView.setupViews(topSeparateView)
        contentView.setupViews(bottomSeparateView)
    }
    
    func configureSubviews() {
        contentView.backgroundColor = Resources.Colors.blueBackground
        
        selectionStyle = .none
        
        descriptionWeatherLabel.numberOfLines = 0
        
        topSeparateView.backgroundColor = Resources.Colors.whiteBackground
        topSeparateView.alpha = 0.3
        
        bottomSeparateView.backgroundColor = Resources.Colors.whiteBackground
        bottomSeparateView.alpha = 0.3
    }
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
            topSeparateView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            topSeparateView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            topSeparateView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            topSeparateView.heightAnchor.constraint(equalToConstant: 1),

            descriptionWeatherLabel.topAnchor.constraint(equalTo: topSeparateView.topAnchor, constant: 10),
            descriptionWeatherLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionWeatherLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            bottomSeparateView.topAnchor.constraint(equalTo: descriptionWeatherLabel.bottomAnchor, constant: 11),
            bottomSeparateView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            bottomSeparateView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            bottomSeparateView.heightAnchor.constraint(equalToConstant: 1)

        ])
    }

    func createDescriptionWeatherLabel(descriptionWeatherText: String) {
        descriptionWeatherLabel.text = descriptionWeatherText
        descriptionWeatherLabel.font = Resources.Fonts.SFProDisplayRegular(with: 17)
        descriptionWeatherLabel.textColor = Resources.Colors.whiteText
        
    }
    
}
