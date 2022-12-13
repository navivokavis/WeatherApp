//
//  MainHeaderView.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 12.12.22.
//

import UIKit

class MainHeaderView: UIView {
    
    var header = UILabel()
    var searchView = UIView()
    var searchBar = UISearchBar()
    
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
        setupViews(header)
        setupViews(searchView)
        searchView.setupViews(searchBar)
    }
    
    func configureSubviews() {
        backgroundColor = Resources.Colors.blackBackground
        
        header.text = Resources.String.headerOnSearch
        header.font = Resources.Fonts.SFProDisplayBold(with: 34)
        header.textColor = Resources.Colors.whiteText
        
        searchView.backgroundColor = Resources.Colors.blackBackground
        
        searchBar.barStyle = .black
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = Resources.String.searchPlaceholder
        searchBar.searchTextField.overrideUserInterfaceStyle = .dark
        searchBar.searchTextField.textColor = Resources.Colors.whiteText
//        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor: Resources.Colors.whiteText])
        
        
    }
    
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
            
//            contentView.heightAnchor.constraint(equalToConstant: 70),
            header.topAnchor.constraint(equalTo: topAnchor),
            header.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            searchView.topAnchor.constraint(equalTo: header.bottomAnchor),
            searchView.bottomAnchor.constraint(equalTo: bottomAnchor),
            searchView.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            searchView.heightAnchor.constraint(equalToConstant: 37),
            
            searchBar.topAnchor.constraint(equalTo: searchView.topAnchor),
            searchBar.bottomAnchor.constraint(equalTo: searchView.bottomAnchor),
            searchBar.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -20)
        ])
    }

    
    
}
