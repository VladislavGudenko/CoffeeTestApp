//
//  Order + SetupUI.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation

extension OrderViewController {
    
    func setupUI() {
        setupTableView()
        setupLabel()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OrderCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.separatorStyle = .none
    }
    
    func setupLabel() {
        descriptionLabel.text = Strings.orderInformer.rawValue
        descriptionLabel.textColor = MainColors.navigationBarTitleColor
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
    }
}
