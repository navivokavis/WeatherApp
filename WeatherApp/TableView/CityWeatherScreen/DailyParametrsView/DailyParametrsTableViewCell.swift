////
////  DailyParametrsTableViewCell.swift
////  WeatherApp
////
////  Created by Navi Vokavis on 13.12.22.
////
//
//import UIKit
//
//class DailyParametrsTableViewCell: UITableViewCell {
//    
//    static let identifier = "DailyParametrsTableViewCell"
//    var leftTitleLabel = UILabel()
//    var leftDescriptionLabel = UILabel()
//    var rightTitleLabel = UILabel()
//    var rightDescriptionLabel = UILabel()
//    var separateView = UIView()
//
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        setup()
//        
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
//    
//    func setup() {
//        buildHierarchy()
//        configureSubviews()
//        layoutConstraint()
//    }
//    
//    func buildHierarchy() {
//        contentView.setupViews(leftTitleLabel)
//        contentView.setupViews(leftDescriptionLabel)
//        contentView.setupViews(rightTitleLabel)
//        contentView.setupViews(rightDescriptionLabel)
//        contentView.setupViews(separateView)
//    }
//    
//    func configureSubviews() {
//        contentView.backgroundColor = Resources.Colors.blueBackground
//        
//        selectionStyle = .none
//        
//        separateView.backgroundColor = Resources.Colors.whiteBackground
//        separateView.alpha = 0.3
//    }
//    
//    func layoutConstraint() {
//        NSLayoutConstraint.activate([
//
//            leftTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7.5),
//            leftTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            
//            leftDescriptionLabel.topAnchor.constraint(equalTo: leftTitleLabel.bottomAnchor, constant: 1),
//            leftDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            
//            rightTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7.5),
//            rightTitleLabel.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -182),
//            
//            rightDescriptionLabel.topAnchor.constraint(equalTo: rightTitleLabel.bottomAnchor, constant: 1),
//            rightDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -182),
//            
//            separateView.topAnchor.constraint(equalTo: leftDescriptionLabel.bottomAnchor, constant: 11),
//            separateView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            separateView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            separateView.heightAnchor.constraint(equalToConstant: 1)
//
//        ])
//    }
//
//    func createTitleLabel(textLeftTitle: String, textRightTitle: String) {
//        leftTitleLabel.text = textLeftTitle
//        leftTitleLabel.font = Resources.Fonts.SFProDisplayRegular(with: 13)
//        leftTitleLabel.textColor = Resources.Colors.whiteText
//        leftTitleLabel.alpha = 0.5
//        
//        rightTitleLabel.text = textRightTitle
//        rightTitleLabel.font = Resources.Fonts.SFProDisplayRegular(with: 13)
//        rightTitleLabel.textColor = Resources.Colors.whiteText
//        rightTitleLabel.alpha = 0.5
//        
//    }
//    
//    func createDescriptionLabel(textLeftDesctiption: String, textRigthDescription: String) {
//        leftDescriptionLabel.text = textLeftDesctiption
//        leftDescriptionLabel.font = Resources.Fonts.SFProDisplayRegular(with: 28)
//        leftDescriptionLabel.textColor = Resources.Colors.whiteText
//        
//        rightDescriptionLabel.text = textRigthDescription
//        rightDescriptionLabel.font = Resources.Fonts.SFProDisplayRegular(with: 28)
//        rightDescriptionLabel.textColor = Resources.Colors.whiteText
//        
//    }
//    
//}
