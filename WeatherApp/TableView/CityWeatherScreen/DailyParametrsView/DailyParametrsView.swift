////
////  DailyParametrsView.swift
////  WeatherApp
////
////  Created by Navi Vokavis on 13.12.22.
////
//
//import UIKit
//
//class DailyParametrsView: UIView {
//    
//    let dailyParametrsView = SelfSizingTableView()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        setup()
//        
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func setup() {
//        buildHierarchy()
//        configureSubviews()
//        layoutConstraint()
//        
//    }
//    
//    func buildHierarchy() {
//        setupViews(dailyParametrsView)
//    }
//    
//    func configureSubviews() {
//        backgroundColor = .cyan
//        //        dailyForecastTableView.backgroundColor = Resources.Colors.blackBackground
//        
//        dailyParametrsView.register(DailyParametrsFirstTableViewCell.self, forCellReuseIdentifier: DailyParametrsFirstTableViewCell.identifier)
//        dailyParametrsView.register(DailyParametrsTableViewCell.self, forCellReuseIdentifier: DailyParametrsTableViewCell.identifier)
//        dailyParametrsView.delegate = self
//        dailyParametrsView.dataSource = self
//        dailyParametrsView.separatorColor = .clear
//    }
//    
//    func layoutConstraint() {
//        NSLayoutConstraint.activate([
//            dailyParametrsView.topAnchor.constraint(equalTo: topAnchor),
//            dailyParametrsView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            dailyParametrsView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            dailyParametrsView.leadingAnchor.constraint(equalTo: leadingAnchor)
//        ])
//    }
//    
//}
//
//
////MARK: - TableView Delegate and DataSource
//
//extension DailyParametrsView: UITableViewDelegate, UITableViewDataSource {
//        
//    //MARK: Row
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 6
//    }
//    
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 0 {
//            guard let cell = tableView.dequeueReusableCell(
//                withIdentifier: DailyParametrsFirstTableViewCell.identifier,
//                for: indexPath)
//                    as? DailyParametrsFirstTableViewCell else {
//                fatalError()
//            }
//            cell.createDescriptionWeatherLabel(descriptionWeatherText: "Cloudy conditions will continue all day. Wind gusts are up ti 9 mph.")
//            return cell
//        }
//        
//        if indexPath.row == 1 {
//            guard let cell = tableView.dequeueReusableCell(
//                withIdentifier: DailyParametrsTableViewCell.identifier,
//                for: indexPath)
//                    as? DailyParametrsTableViewCell else {
//                fatalError()
//            }
//            cell.createTitleLabel(textLeftTitle: "SUNRISE", textRightTitle: "SUNSET")
//            cell.createDescriptionLabel(textLeftDesctiption: "07.53", textRigthDescription: "18.22")
//            return cell
//        }
//        
//        if indexPath.row == 2 {
//            guard let cell = tableView.dequeueReusableCell(
//                withIdentifier: DailyParametrsTableViewCell.identifier,
//                for: indexPath)
//                    as? DailyParametrsTableViewCell else {
//                fatalError()
//            }
//            cell.createTitleLabel(textLeftTitle: "CHANCE OF RAIN", textRightTitle: "HUMIDITY")
//            cell.createDescriptionLabel(textLeftDesctiption: "07.53", textRigthDescription: "18.22")
//            return cell
//        }
//        
//        if indexPath.row == 3 {
//            guard let cell = tableView.dequeueReusableCell(
//                withIdentifier: DailyParametrsTableViewCell.identifier,
//                for: indexPath)
//                    as? DailyParametrsTableViewCell else {
//                fatalError()
//            }
//            cell.createTitleLabel(textLeftTitle: "WIND", textRightTitle: "FEELS LIKE")
//            cell.createDescriptionLabel(textLeftDesctiption: "07.53", textRigthDescription: "18.22")
//            return cell
//        }
//        
//        if indexPath.row == 4 {
//            guard let cell = tableView.dequeueReusableCell(
//                withIdentifier: DailyParametrsTableViewCell.identifier,
//                for: indexPath)
//                    as? DailyParametrsTableViewCell else {
//                fatalError()
//            }
//            cell.createTitleLabel(textLeftTitle: "PRECIPITATION", textRightTitle: "PRESSURE")
//            cell.createDescriptionLabel(textLeftDesctiption: "07.53", textRigthDescription: "18.22")
//            return cell
//        }
//        
//            guard let cell = tableView.dequeueReusableCell(
//                withIdentifier: DailyParametrsTableViewCell.identifier,
//                for: indexPath)
//                    as? DailyParametrsTableViewCell else {
//                fatalError()
//            }
//            cell.createTitleLabel(textLeftTitle: "VISIBILITY", textRightTitle: "UV INDEX")
//            cell.createDescriptionLabel(textLeftDesctiption: "07.53", textRigthDescription: "18.22")
//            return cell
//        
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 68
//    }
//    
//}
//
//
