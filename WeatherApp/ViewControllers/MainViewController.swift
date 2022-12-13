//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 12.12.22.
//

import UIKit

class MainViewController: UIViewController {
    
    var mainScreenTableView = MainScreenTableView()
    
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
        view.setupViews(mainScreenTableView)
    }
    
    func configureSubviews() {
//        navigationController?.isNavigationBarHidden = true
        navigationController?.setupNavigationController()
        navigationController?.navigationBar.isHidden = true
    }
    
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
            mainScreenTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainScreenTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainScreenTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainScreenTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    
    
}

func getRootNavigationController() -> UINavigationController? {
    return UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController as? UINavigationController ?? UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController?.navigationController
}

