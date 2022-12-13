//
//  HourlyTemperatureView.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 12.12.22.
//

import UIKit

class HourlyTemperatureView: UIView {
    
    var collectionView: UICollectionView!
    private var weatherModel: WeatherModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if let weatherModel = weatherModel {
            configure(model: weatherModel)
        }
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
//        setupViews(collectionView)
    }
    
    func configureSubviews() {
        collectionView = UICollectionView(frame: bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = Resources.Colors.blueBackground
        setupViews(collectionView)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HourlyCollectionViewCell.self, forCellWithReuseIdentifier: HourlyCollectionViewCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        
    }
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),

        ])
    }
    
    func configure(model: WeatherModel) {
        self.weatherModel = model
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }

    
    //MARK: - Create Collection View Layout
    
    func createLayout() -> UICollectionViewLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
            config.scrollDirection = .horizontal
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 1, bottom: 0, trailing: 1)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section, configuration: config)

        return layout
    }
    
    private func configureCollectionCellViewModelFor(_ index: Int) -> HourlyCollectionViewCellViewModel  {
        var tempLabelString: String?
        var timeLabelString: String?
        var humidityLabelString: String?
        var iconImage: UIImage?
        var urlStringForImage: String?
        
        if let weatherModel = weatherModel {
            let hourlyModel = weatherModel.hourly[index]
            let hourForDate = Date(timeIntervalSince1970: Double(hourlyModel.dt)).getHourForDate()
            let nextHourForDate = Date(timeIntervalSince1970: Double(weatherModel.hourly[index + 1].dt)).getTimeForDate()
            let timeForDate = Date(timeIntervalSince1970: Double(hourlyModel.dt)).getTimeForDate()
            let sunset = Date(timeIntervalSince1970: Double(weatherModel.current.sunset)).getTimeForDate()
            let sunrise = Date(timeIntervalSince1970: Double(weatherModel.current.sunrise)).getTimeForDate()
            urlStringForImage = "http://openweathermap.org/img/wn/\(hourlyModel.weather[0].icon)@2x.png"
            
            if index == 0 {
                timeLabelString = "Now"
                iconImage = nil
                tempLabelString = String(format: "%.f", weatherModel.hourly[index].temp) + "°"
            } else {
                if sunset >= timeForDate && sunset < nextHourForDate {
                    tempLabelString = "Sunset"
                    iconImage = #imageLiteral(resourceName: "sunset")
                    timeLabelString = sunset
                } else if sunrise >= timeForDate && sunrise < nextHourForDate {
                    tempLabelString = "Sunrise"
                    iconImage = #imageLiteral(resourceName: "sunrise")
                    timeLabelString = sunrise
                } else {
                    iconImage = nil
                    tempLabelString = String(format: "%.f", weatherModel.hourly[index].temp) + "°"
                    timeLabelString = hourForDate
                }
            }
            if hourlyModel.humidity >= 30 {
                humidityLabelString = String(hourlyModel.humidity) + " %"
            } else {
                humidityLabelString = ""
            }
        }
        return HourlyCollectionViewCellViewModel(tempLabelString: tempLabelString,
                                                 timeLabelString: timeLabelString,
                                                 humidityLabelString: humidityLabelString,
                                                 iconImage: iconImage,
                                                 urlString: urlStringForImage)
    }
    
    
}


extension HourlyTemperatureView: UICollectionViewDelegate, UICollectionViewDataSource  {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyCollectionViewCell.identifier, for: indexPath) as! HourlyCollectionViewCell
        
        let viewModel = configureCollectionCellViewModelFor(indexPath.row)
        cell.setupCell(viewModel)
        cell.backgroundColor = .red
        return cell
    }
    
}

