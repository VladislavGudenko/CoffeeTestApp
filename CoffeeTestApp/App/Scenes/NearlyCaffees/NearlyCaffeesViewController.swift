//
//  NearlyCaffesViewController.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 05.02.2024.
//

import Foundation
import UIKit
import YandexMapsMobile

class NearlyCaffeesViewController: UIViewController, NearlyCaffeesViewProtocol {
    
    var presenter: NearlyCaffeesPresenterProtocol?
    
    var response: [LocationsEntity] = []
    var ymkPoints: [YMKPoint] = []
    
    let tableView = UITableView()
    let onMapButton = CustomBigButton(frame: .zero,
                                      buttonTitle: Strings.showOnMap.rawValue)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        setupUI()
        addSubviews()
    }
    
    func setupNavBar() {
        self.navigationItem.title = Strings.nearlyCaffees.rawValue
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = MainColors.navigationBarColor
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = MainColors.navigationBarColor
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    func setupUI() {
        setupNavBar()
        setupButton()
        setupTableView()
    }
    
    @objc func onMapTap() {
        presenter?.openMapScene(with: self, with: ymkPoints)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func displayCaffees(_ locationsItems: [LocationsEntity], _ ymkPoints: [YMKPoint]) {
        self.response = locationsItems
        self.ymkPoints = ymkPoints
        tableView.reloadData()
    }
}
