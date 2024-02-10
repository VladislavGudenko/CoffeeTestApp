//
//  Menu + View.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 08.02.2024.
//

import Foundation
import UIKit

extension MenuViewController {
    
    func addSubviews() {
        view.addSubview(collectionView)
        view.addSubview(paymentButton)
        setupLayouts()
    }
    
    func setupLayouts() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
        }
        paymentButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(collectionView.snp.bottom).offset(30)
        }
    }
}
