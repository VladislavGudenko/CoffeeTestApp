//
//  MenuCell + InitView.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 10.02.2024.
//

import Foundation
import UIKit

extension MenuCollectionViewCell {
    
    func setupUI() {
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        coffeeNameLabel.font = UIFont.systemFont(ofSize: 18)
        coffeeNameLabel.textColor = UIColor(named: "customBrown")
        
        priceLabel.font = UIFont.systemFont(ofSize: 18)
        priceLabel.textColor = UIColor(named: "customBrown")
        
        minusButton.setImage(UIImage(named: "minusIcon"), for: .normal)
        
        currentCountLabel.font = UIFont.systemFont(ofSize: 18)
        currentCountLabel.textColor = UIColor(named: "customBrown")
        
        plusButton.setImage(UIImage(named: "plusIcon"), for: .normal)
        
        mainStackView.axis = .vertical
        mainStackView.spacing = 5
        contentView.addSubview(mainStackView)
        bottomStackView.axis = .horizontal
        bottomStackView.spacing = 10
        
        mainStackView.addArrangedSubview(image)
        mainStackView.addArrangedSubview(coffeeNameLabel)
        mainStackView.addArrangedSubview(bottomStackView)
        mainStackView.addArrangedSubview(spacingView)
        
        bottomStackView.addArrangedSubview(priceLabel)
        bottomStackView.addArrangedSubview(minusButton)
        bottomStackView.addArrangedSubview(currentCountLabel)
        bottomStackView.addArrangedSubview(plusButton)
        
        setupLayouts()
    }
    
    func setupLayouts() {
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        image.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }
        coffeeNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.height.equalTo(28)
        }
        bottomStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview()
        }
        priceLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
        }
        minusButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
        }
        currentCountLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
        }
        plusButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
        }
        spacingView.snp.makeConstraints { make in
            make.height.equalTo(10)
        }
    }
}
