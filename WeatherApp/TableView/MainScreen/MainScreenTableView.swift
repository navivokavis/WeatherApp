//
//  MainScreenTableView.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 12.12.22.
//

import UIKit

class MainScreenTableView: UIView {
    
    let weatherListTableView = UITableView()
    
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
        setupViews(weatherListTableView)
    }
    
    func configureSubviews() {
        
        
        weatherListTableView.backgroundColor = Resources.Colors.blackBackground
        
        weatherListTableView.register(MainScreenFirstTableViewCell.self, forCellReuseIdentifier: MainScreenFirstTableViewCell.identifier)
        weatherListTableView.register(MainScreenCityWeatherTableViewCell.self, forCellReuseIdentifier: MainScreenCityWeatherTableViewCell.identifier)
        weatherListTableView.delegate = self
        weatherListTableView.dataSource = self
        weatherListTableView.separatorColor = .clear
    }
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
            weatherListTableView.topAnchor.constraint(equalTo: topAnchor),
            weatherListTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            weatherListTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            weatherListTableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
}


//MARK: - TableView Delegate and DataSource

extension MainScreenTableView: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Section
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var view = MainHeaderView()
        return view
    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        var sectionName: String = ""
//        if section < 1 {
//            sectionName = "Weather"
////            return sectionName
//        }
//        return sectionName
//    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        80
//    }
    
    
    //MARK: Row
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cityArray.count + 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if indexPath.row < 1 {
//            guard let cell = tableView.dequeueReusableCell(
//                withIdentifier: MainScreenFirstTableViewCell.identifier,
//                for: indexPath)
//                    as? MainScreenFirstTableViewCell else {
//                fatalError()
//            }
//            return cell
//        }
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MainScreenCityWeatherTableViewCell.identifier,
            for: indexPath)
                as? MainScreenCityWeatherTableViewCell else {
            fatalError()
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        let vc = CityWeatherViewController()
        getRootNavigationController()!.pushViewController(vc, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
    
}


