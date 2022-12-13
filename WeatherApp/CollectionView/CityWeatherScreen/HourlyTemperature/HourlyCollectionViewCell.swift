//
//  HourlyCollectionViewCell.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 12.12.22.
//

import UIKit

struct HourlyCollectionViewCellViewModel {
    let tempLabelString: String?
    let timeLabelString: String?
    let humidityLabelString: String?
    let iconImage: UIImage?
    let urlString: String?
}

final class HourlyCollectionViewCell: UICollectionViewCell {
    
    var tempLabel = UILabel()
    var timeLabel = UILabel()
    var humidityLabel = UILabel()
    var iconImageView = UIImageView()
    
    static let identifier = "HourlyCollectionViewCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //        contentView.addSubview(iconImageView)
        layoutSubviews()
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
        setupViews(humidityLabel)
        setupViews(iconImageView)
    }
    
    func configureSubviews() {
        timeLabel.textColor = Resources.Colors.whiteText
        timeLabel.font = Resources.Fonts.SFProDisplayBold(with: 15)
//        timeLabel.text = "21"
        
        tempLabel.textColor = Resources.Colors.whiteText
        tempLabel.font = Resources.Fonts.SFProDisplayBold(with: 15)
//        tempLabel.text = "@13"
        
        humidityLabel.textColor = Resources.Colors.whiteText
        humidityLabel.font = Resources.Fonts.SFProDisplayBold(with: 15)
//        humidityLabel.text = "fdsf"
    }
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
            tempLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            tempLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            tempLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            timeLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            iconImageView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            iconImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            humidityLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -9),
            humidityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            humidityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),

        ])
    }
    
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //    }
    //
    //    static func nib() -> UINib {
    //        return UINib(nibName: "HourlyCollectionViewCell",
    //                     bundle: nil)
    //    }
    
    func setupCell(_ viewModel: HourlyCollectionViewCellViewModel) {
        if viewModel.timeLabelString == "Now" {
            timeLabel.text = "Now"
            timeLabel.font = UIFont.boldSystemFont(ofSize: 17)
            tempLabel.text = viewModel.tempLabelString
            tempLabel.font = UIFont.boldSystemFont(ofSize: 17)
        } else {
            timeLabel.text = viewModel.timeLabelString
            tempLabel.text = viewModel.tempLabelString
        }

        if viewModel.iconImage != nil {
            iconImageView.image = viewModel.iconImage
        } else {
            //            iconImageView.downloaded(from: viewModel.urlString ?? "")
        }

        humidityLabel.text = viewModel.humidityLabelString
    }
    
}

