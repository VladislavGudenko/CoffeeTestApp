//
//  TextFieldName.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 05.02.2024.
//

import Foundation
import UIKit

class TextFieldName: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.textColor = MainColors.firstBrown
    }
}
