//
//  MainScreenTableView.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 12.12.22.
//

import UIKit

class MainScreenTableViewController: UITableViewController {
    
    var weatherModelArray = [WeatherModel]()
    var searchController = UISearchController()
    var searchBar = UISearchBar()
    var searchResult: [CityModel] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func update() {
        tableView.reloadData()
    }
    
    func setup() {
        buildHierarchy()
        configureSubviews()
        layoutConstraint()
        
    }
    
    func buildHierarchy() {
        
    }
    
    func configureSubviews() {
        navigationController?.setupNavigationController()
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchBar.showsCancelButton = true
//        searchBar.becomeFirstResponder()
        
        for i in cityArray {
            APIManager.shared.fetchLocationFromCity(city: i) { [weak self] cities in
                guard let model = cities else { return }
                cityModelArray.append(model)
                DispatchQueue.main.async {
                    self?.update()
                }
            }
            
        }
        self.title = "Weather"
        
        tableView.backgroundColor = Resources.Colors.blackBackground
        
        tableView.register(MainScreenCityWeatherTableViewCell.self, forCellReuseIdentifier: MainScreenCityWeatherTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        
    }
    
    func layoutConstraint() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
    }
    
    
    
    //MARK: - TableView Delegate and DataSource
        
    //MARK: Section
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = MainHeaderView()
//        view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300).isActive = true
//        return view
//    }
    
    //MARK: Row
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var numberOfRow = 0
        if searchResult.isEmpty {
            return cityModelArray.count
        } else {
            return searchResult.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MainScreenCityWeatherTableViewCell.identifier,
            for: indexPath)
                as? MainScreenCityWeatherTableViewCell else {
            fatalError()
        }
        if searchResult.isEmpty {
            let rowData = cityArray[indexPath.row]
            cell.cityLabel.text = rowData
            cell.urlRequest(model: cityModelArray[indexPath.row])
        } else {
            var rowData = searchResult[indexPath.row]
            cell.cityLabel.text = rowData.name
            cell.urlRequest(model: searchResult[indexPath.row])

        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        tableView.deselectRow(at: indexPath, animated: true)
        let cityWeatherController = CityWeatherViewController(
            cityModel: searchResult.isEmpty ? cityModelArray[indexPath.row] : searchResult[indexPath.row])
        
        self.navigationController!.pushViewController(cityWeatherController, animated: true)
    }
    
}

extension MainScreenTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchResult = cityModelArray.filter({ $0.name.contains(searchText)})
               tableView.reloadData()
        print(searchResult)
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        becomeFirstResponder()
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchResult.removeAll()
        tableView.reloadData()
    }
}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}



