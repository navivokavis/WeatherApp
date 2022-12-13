//
//  CityWeatherViewController.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 12.12.22.
//

import UIKit
import CoreLocation

@available(iOS 16.0, *)
final class CityWeatherViewController: UIViewController {
    
    var detailFullHeaderView = DetailFullHeaderView()
    var detailShortHeaderView = DetailShortHeaderView()
    var hourlyTemperatureView = HourlyTemperatureView()
    var scrollView = UIScrollView()
    var stackView = UIStackView()
    var dailyForecastView = DailyForecastView()
    var dailyParametrsView = DailyParametrsView()
    
    var hourlyTemperatureViewTopConstraint: NSLayoutConstraint!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    
    
    func setup() {
        buildHierarchy()
        configureSubviews()
        layoutConstraint()
    }
    
    func buildHierarchy() {
        view.setupViews(detailFullHeaderView)
        view.setupViews(detailShortHeaderView)
        view.setupViews(hourlyTemperatureView)
        view.setupViews(scrollView)
        stackView.addArrangedSubview(dailyForecastView)
        stackView.addArrangedSubview(dailyParametrsView)
        scrollView.setupViews(stackView)

    }
    
    func configureSubviews() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = Resources.Colors.blueBackground
        
        detailShortHeaderView.isHidden = true
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.backgroundColor = Resources.Colors.blueBackground
        
        scrollView.delegate = self
        
        dailyForecastView.dailyForecastTableView.reloadData()
        dailyParametrsView.dailyParametrsView.reloadData()
        
        detailFullHeaderView.addBackButtonAction(#selector(backButtonTapped), with: self)
    }
    
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
            detailFullHeaderView.topAnchor.constraint(equalTo: view.topAnchor),
            detailFullHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailFullHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            detailShortHeaderView.topAnchor.constraint(equalTo: view.topAnchor),
            detailShortHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailShortHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
//            hourlyTemperatureView.topAnchor.constraint(equalTo: detailFullHeaderView.bottomAnchor),
            hourlyTemperatureView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hourlyTemperatureView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hourlyTemperatureView.heightAnchor.constraint(equalToConstant: 117),
            
            scrollView.topAnchor.constraint(equalTo: hourlyTemperatureView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            dailyForecastView.widthAnchor.constraint(equalTo: view.widthAnchor),

            dailyParametrsView.widthAnchor.constraint(equalTo: view.widthAnchor)

        ])
        
        hourlyTemperatureViewTopConstraint = hourlyTemperatureView.topAnchor.constraint(equalTo: detailFullHeaderView.bottomAnchor)
        hourlyTemperatureViewTopConstraint.isActive = true
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension CityWeatherViewController: UIScrollViewDelegate {
        
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        detailShortHeaderView.isHidden = false
        detailFullHeaderView.isHidden = true
        hourlyTemperatureViewTopConstraint = hourlyTemperatureView.topAnchor.constraint(equalTo: detailShortHeaderView.bottomAnchor)


    }
    
}
