//
//  Menu + SetupUI.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 08.02.2024.
//

import Foundation

extension MenuViewController {
    
    func setupUI() {
        setupCollection()
        setupButton()
    }
    
    func setupCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func setupButton() {
        paymentButton.addTarget(self, action: #selector(paymentTap), for: .touchUpInside)
    }
}
