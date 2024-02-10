//
//  Order + InitView.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 09.02.2024.
//

import Foundation

extension OrderViewController {
    
    func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(descriptionLabel)
        view.addSubview(makeOrderButton)
        setupLayouts()
    }
    
    func setupLayouts() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(300)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(80)
        }
        makeOrderButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(40)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
