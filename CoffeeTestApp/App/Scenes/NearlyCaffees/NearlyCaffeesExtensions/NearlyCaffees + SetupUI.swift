//
//  NearlyCaffees + SetupUI.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation

extension NearlyCaffeesViewController {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NearlyCaffeesTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.separatorStyle = .none
    }
    
    func setupButton() {
        onMapButton.addTarget(self, action: #selector(onMapTap), for: .touchUpInside)
    }
}
