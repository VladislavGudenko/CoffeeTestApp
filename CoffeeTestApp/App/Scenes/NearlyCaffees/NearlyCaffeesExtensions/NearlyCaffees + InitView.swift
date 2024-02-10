//
//  NearlyCaffees + InitView.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation

extension NearlyCaffeesViewController {
    
    func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(onMapButton)
        setupLayout()
    }
    
    func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            make.leading.trailing.equalToSuperview().inset(18)
            make.bottom.equalToSuperview().inset(200)
        }
        onMapButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(40)
            make.leading.trailing.equalToSuperview().inset(18)
        }
    }
}
