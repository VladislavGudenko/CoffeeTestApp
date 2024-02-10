//
//  CustomTextField.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 05.02.2024.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    
    init(text: String,
         isNeedToSecure: Bool) {
        super.init(frame: .zero)
        self.placeholder = text
        self.isSecureTextEntry = isNeedToSecure
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.textColor = MainColors.placeholderBrown
        self.layer.cornerRadius = 20
        self.layer.borderColor = MainColors.firstBrown.cgColor
        self.layer.borderWidth = 2
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
