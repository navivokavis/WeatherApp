//
//  HourlyTableViewCell.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 16.12.22.
//

import UIKit

class HourlyTableViewCell: UITableViewCell {
    
    var collectionView: UICollectionView!
    var weatherModel: WeatherModel?
    var bottomSeparateView = UIView()
    static var identifier = "HourlyTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupCollentionView()
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
        setupViews(bottomSeparateView)
    }
    
    func configureSubviews() {
        bottomSeparateView.backgroundColor = Resources.Colors.whiteBackground
        bottomSeparateView.alpha = 0.3
    }
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            bottomSeparateView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            bottomSeparateView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bottomSeparateView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            bottomSeparateView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func configure(model: WeatherModel) {
        self.weatherModel = model
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    func setupCollentionView() {
        collectionView = UICollectionView(frame: bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = Resources.Colors.blueBackground
        contentView.setupViews(collectionView)
        //        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(HourlyCollectionViewCell.self, forCellWithReuseIdentifier: HourlyCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
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
    
}


extension HourlyTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource  {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyCollectionViewCell.identifier, for: indexPath) as! HourlyCollectionViewCell
        
        if let weatherModel = weatherModel {
            cell.setupcell(model: weatherModel, indexPath: indexPath)
        }
        return cell
    }
    
}
