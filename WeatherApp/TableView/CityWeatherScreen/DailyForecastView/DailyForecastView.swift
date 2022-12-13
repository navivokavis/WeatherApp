//
//  DailyForecastView.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 13.12.22.
//

import UIKit

class DailyForecastView: UIView {
    
    let dailyForecastTableView = SelfSizingTableView()
    
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
        setupViews(dailyForecastTableView)
    }
    
    func configureSubviews() {
        dailyForecastTableView.isScrollEnabled = false
        dailyForecastTableView.register(DailyForecastTableViewCell.self, forCellReuseIdentifier: DailyForecastTableViewCell.identifier)
        dailyForecastTableView.delegate = self
        dailyForecastTableView.dataSource = self
        dailyForecastTableView.separatorColor = .clear
    }
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
            dailyForecastTableView.topAnchor.constraint(equalTo: topAnchor),
            dailyForecastTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            dailyForecastTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dailyForecastTableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
}


//MARK: - TableView Delegate and DataSource

extension DailyForecastView: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Row
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DailyForecastTableViewCell.identifier,
            for: indexPath)
                as? DailyForecastTableViewCell else {
            fatalError()
        }
        return cell
    }
    
}


