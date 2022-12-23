//
//  CityWeatherViewController.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 12.12.22.
//

import UIKit
import CoreLocation

class CityWeatherViewController: UIViewController {
    
    var detailHeaderView = DetailHeaderView()
    var tableView = UITableView()
    var weatherModel: WeatherModel?
    var cityModel: CityModel?
    var cityLon: String = ""
    var cityLat: String = ""
    var cityName: String = ""
    var scrollView = UIScrollView()
    var backButton = UIButton()
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    var tableViewConstraint: NSLayoutConstraint!

    deinit {
        print("function")
    }
    
    init(cityModel: CityModel? = nil) {
        self.cityModel = cityModel
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

         activityIndicator.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
         activityIndicator.hidesWhenStopped = true
         activityIndicator.startAnimating()
         activityIndicator.center = CGPoint(x: view.frame.size.width/2, y: view.frame.size.height/2)
         view.addSubview(activityIndicator)
    }
    
    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(animated)
        
        APIManager.shared.fetchCurrentWeather(lat: "\(cityModel?.lat ?? 0)", lon: "\(cityModel?.lon ?? 0)") { [weak self] weather in
            guard let weather = weather else { return }
            DispatchQueue.main.async {
                self?.weatherModel = weather
                self?.tableView.reloadData()
                self?.detailHeaderView.setupcell(model: weather, cityName: self?.cityModel?.name ?? "")
                self?.activityIndicator.stopAnimating()
            }
        }
    }
    
    func setup() {
        buildHierarchy()
        configureSubviews()
        layoutConstraint()
    }
    
    func buildHierarchy() {
        view.setupViews(scrollView)
        scrollView.setupViews(detailHeaderView)
        scrollView.setupViews(tableView)
        scrollView.setupViews(backButton)
    }
    
    func configureSubviews() {
        view.backgroundColor = Resources.Colors.blueBackground
        navigationController?.navigationBar.isHidden = true
                
        tableView.backgroundColor = Resources.Colors.blueBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HourlyTableViewCell.self, forCellReuseIdentifier: HourlyTableViewCell.identifier)
        tableView.register(DailyTableViewCell.self, forCellReuseIdentifier: DailyTableViewCell.identifier)
        tableView.register(InformationTableViewCell.self,
                           forCellReuseIdentifier: InformationTableViewCell.identifier)
        tableView.register(DescriptionTableViewCell.self,
                           forCellReuseIdentifier: DescriptionTableViewCell.identifier)
        tableView.separatorColor = .clear

        backButton.setImage(Resources.Images.leftArrow, for: .normal)
        backButton.tintColor = Resources.Colors.whiteText
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

    }
    
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            detailHeaderView.topAnchor.constraint(equalTo: view.topAnchor),
            detailHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//                        detailFullHeaderView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 53),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            tableView.topAnchor.constraint(equalTo: detailHeaderView.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
            
        ])

    }
    
        @objc func backButtonTapped() {
            self.navigationController?.popViewController(animated: true)

        }
    
}

extension CityWeatherViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        if scrollView.contentOffset.y < 5 {
            detailHeaderView.isFullView = true
        } else {
            detailHeaderView.isFullView = false
        }
    }
}

extension CityWeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return WeatherTableViewSection.numberOfSection
    }
    //MARK: Row
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = WeatherTableViewSection(sectionIndex: section) else { return 0 }
        
        switch section {
        case .hourly:
            return 1
        case .daily:
            return 7
        case .information:
            return 1
        case .description:
            return descriptionWeatherLabelTextArray.count / 2
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let section = WeatherTableViewSection(sectionIndex: indexPath.section) else { return UITableViewCell() }
        //
        switch section {
        case .hourly:
            let cell = tableView.dequeueReusableCell(withIdentifier: HourlyTableViewCell.identifier, for: indexPath) as! HourlyTableViewCell
            
            if let weatherModel = weatherModel {
                cell.weatherModel = weatherModel
                cell.configure(model: weatherModel)
            }
            return cell
            
        case .daily:
            let cell = tableView.dequeueReusableCell(withIdentifier: DailyTableViewCell.identifier, for: indexPath) as! DailyTableViewCell

            if let weatherModel = weatherModel {
                cell.setupcell(model: weatherModel, indexPath: indexPath)
            }
            return cell
            
        case .information:
            let cell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCell.identifier, for: indexPath) as! InformationTableViewCell
            
                         if let weatherModel = weatherModel {
                             cell.setupcell(model: weatherModel, indexPath: indexPath)
                         }
            return cell
            
        case .description:
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier, for: indexPath) as! DescriptionTableViewCell
 
            if let weatherModel = weatherModel {
                cell.setupcell(model: weatherModel, indexPath: indexPath)
            }
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    //        return true
    //    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = WeatherTableViewSection(sectionIndex: indexPath.section) else { return CGFloat() }
        switch section {
        case .hourly:
            return section.cellHeight
        case .daily:
            return section.cellHeight
        case .information:
            return section.cellHeight
        case .description:
            return section.cellHeight
        }
    }
    
}

