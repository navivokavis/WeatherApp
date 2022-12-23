//
//  DailyForecastView.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 13.12.22.
//

import UIKit

//class DailyForecastView: UIView {
//
//    let dailyForecastTableView = SelfSizingTableView()
//    var weatherModel: WeatherModel?
//
//    var forwardIndexPath: IndexPath?
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
//        setupViews(dailyForecastTableView)
//    }
//
//    func configureSubviews() {
//        dailyForecastTableView.isScrollEnabled = false
//        dailyForecastTableView.register(DailyTableViewCell.self, forCellReuseIdentifier: DailyTableViewCell.identifier)
//        dailyForecastTableView.delegate = self
//        dailyForecastTableView.dataSource = self
//        dailyForecastTableView.separatorColor = .clear
//    }
//
//    func layoutConstraint() {
//        NSLayoutConstraint.activate([
//            dailyForecastTableView.topAnchor.constraint(equalTo: topAnchor),
//            dailyForecastTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            dailyForecastTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            dailyForecastTableView.leadingAnchor.constraint(equalTo: leadingAnchor)
//        ])
//    }
//
//
//
//
//
//}


//MARK: - TableView Delegate and DataSource

//extension DailyForecastView: UITableViewDelegate, UITableViewDataSource {
//
//    //MARK: Row
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return cityModelArray.count
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(
//            withIdentifier: DailyForecastTableViewCell.identifier,
//            for: indexPath)
//                as! DailyForecastTableViewCell
//        if let weatherModel = weatherModel {
//            cell.configure(model: weatherModel)
//        }
////        let viewModel = cell.configureTableViewCellViewModelFor(indexPath.row)
////        cell.setupCell(viewModel)
//        cell.configureCell(model: cityModelArray[indexPath.row])
//
////        cell.configureCell(model: cityModelArray[indexPath.row])
//        return cell
//    }
//
//}


