//
//  CustomBigButton.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 05.02.2024.
//

import Foundation
import UIKit

class CustomBigButton: UIButton {
    
    init(frame: CGRect, buttonTitle: String) {
        super.init(frame: .zero)
        
        setupUI(withTitle: buttonTitle)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(withTitle: String) {
        self.backgroundColor = MainColors.buttonBackground
        self.setTitle(withTitle, for: .normal)
        self.setTitleColor(MainColors.placeholderBrown, for: .normal)
        self.layer.cornerRadius = 20
    }
}
