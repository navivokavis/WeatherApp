//
//  DescriptionTableViewCell.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 18.12.22.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    static let identifier = "DescriptionTableViewCell"
    var leftTitleLabel = UILabel()
    var leftDescriptionLabel = UILabel()
    var rightTitleLabel = UILabel()
    var rightDescriptionLabel = UILabel()
    var separateView = UIView()
    
    
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
        contentView.setupViews(leftTitleLabel)
        contentView.setupViews(leftDescriptionLabel)
        contentView.setupViews(rightTitleLabel)
        contentView.setupViews(rightDescriptionLabel)
        contentView.setupViews(separateView)
    }
    
    func configureSubviews() {
        contentView.backgroundColor = Resources.Colors.blueBackground
        
        selectionStyle = .none
        
        separateView.backgroundColor = Resources.Colors.whiteBackground
        separateView.alpha = 0.3
        
        leftTitleLabel.font = Resources.Fonts.SFProDisplayRegular(with: 13)
        leftTitleLabel.textColor = Resources.Colors.whiteText
        leftTitleLabel.alpha = 0.5
        
        leftDescriptionLabel.font = Resources.Fonts.SFProDisplayRegular(with: 28)
        leftDescriptionLabel.textColor = Resources.Colors.whiteText
        
        rightTitleLabel.font = Resources.Fonts.SFProDisplayRegular(with: 13)
        rightTitleLabel.textColor = Resources.Colors.whiteText
        rightTitleLabel.alpha = 0.5
        
        rightDescriptionLabel.font = Resources.Fonts.SFProDisplayRegular(with: 28)
        rightDescriptionLabel.textColor = Resources.Colors.whiteText
    }
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
            separateView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            separateView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            separateView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            separateView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            separateView.heightAnchor.constraint(equalToConstant: 1),
            
            leftTitleLabel.topAnchor.constraint(equalTo: separateView.bottomAnchor, constant: 7.5),
            leftTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            leftDescriptionLabel.topAnchor.constraint(equalTo: leftTitleLabel.bottomAnchor, constant: 1),
            leftDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            rightTitleLabel.topAnchor.constraint(equalTo: separateView.bottomAnchor, constant: 7.5),
            rightTitleLabel.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -182),
            
            rightDescriptionLabel.topAnchor.constraint(equalTo: rightTitleLabel.bottomAnchor, constant: 1),
            rightDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -182),

        ])
    }
    
    func setupcell(model: WeatherModel, indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            leftTitleLabel.text = descriptionWeatherLabelTextArray[indexPath.row]
            rightTitleLabel.text = descriptionWeatherLabelTextArray[indexPath.row + 1]
            
            leftDescriptionLabel.text = Date(timeIntervalSince1970: Double(model.current.sunrise)).getTimeForDate()
            rightDescriptionLabel.text = Date(timeIntervalSince1970: Double(model.current.sunset)).getTimeForDate()
            
        case 1:
            leftTitleLabel.text = descriptionWeatherLabelTextArray[indexPath.row + 1]
            rightTitleLabel.text = descriptionWeatherLabelTextArray[indexPath.row + 2]
            
            leftDescriptionLabel.text = "\(model.current.clouds) %"
            rightDescriptionLabel.text = "\(model.current.humidity) %"
            
        case 2:
            leftTitleLabel.text = descriptionWeatherLabelTextArray[indexPath.row + 2]
            rightTitleLabel.text = descriptionWeatherLabelTextArray[indexPath.row + 3]
            
            leftDescriptionLabel.text = "s \(Int(model.current.windSpeed)) km/hr"
            rightDescriptionLabel.text = "\(Int(model.current.feelsLike))˚"
            
        case 3:
            leftTitleLabel.text = descriptionWeatherLabelTextArray[indexPath.row + 3]
            rightTitleLabel.text = descriptionWeatherLabelTextArray[indexPath.row + 4]

            leftDescriptionLabel.text = "no data"
            rightDescriptionLabel.text = "\(model.current.pressure) hPa"
            
        case 4:
            leftTitleLabel.text = descriptionWeatherLabelTextArray[indexPath.row + 4]
            rightTitleLabel.text = descriptionWeatherLabelTextArray[indexPath.row + 5]

            leftDescriptionLabel.text = "\(Int(model.current.visibility)) km"
            rightDescriptionLabel.text = "\(model.current.uvi)"
            
        default:
            print("default value")
        }
    }
    
}
