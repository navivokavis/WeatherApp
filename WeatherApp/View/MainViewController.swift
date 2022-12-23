////
////  MainViewController.swift
////  WeatherApp
////
////  Created by Navi Vokavis on 12.12.22.
////
//
//import UIKit
//import CoreLocation
//
//class MainViewController: UIViewController {
//
////    var mainScreenTableView = MainScreenTableView()
//
//    let locationManager = CLLocationManager()
//    var currentLocation: CLLocation?
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setup()
//
//    }
//

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        setupLocation()
//
//    }
//
//    func setup() {
//        buildHierarchy()
//        configureSubviews()
//        layoutConstraint()
//    }
//
//    func buildHierarchy() {
//        view.setupViews(mainScreenTableView)
//    }
//
//    func configureSubviews() {
//        navigationController?.setupNavigationController()
//        navigationController?.navigationBar.isHidden = true
//    }
//
//
//    func layoutConstraint() {
//        NSLayoutConstraint.activate([
//            mainScreenTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            mainScreenTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            mainScreenTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            mainScreenTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
//        ])
//    }
//
//    func setupLocation() {
//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//    }
//
//
//    func requestWeatherForLocation() {
//        guard let currentLocation = currentLocation else { return }
//        let lat = currentLocation.coordinate.latitude
//        let long = currentLocation.coordinate.longitude
//
//        print("\(lat), \(long)")
//    }
//
//}
//
//func getRootNavigationController() -> UINavigationController? {
//    return UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController as? UINavigationController ?? UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController?.navigationController
//}
//
//extension MainViewController: CLLocationManagerDelegate {
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if !locations.isEmpty, currentLocation == nil {
//            currentLocation = locations.first
//            locationManager.stopUpdatingLocation()
//            requestWeatherForLocation()
//        }
//    }
//}
