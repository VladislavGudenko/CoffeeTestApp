//
//  VerticalStackView.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 05.02.2024.
//

import Foundation
import UIKit

class VerticalStackView: UIStackView {
    
    init(frame: CGRect, spacing: CGFloat) {
        super.init(frame: .zero)
        self.spacing = spacing
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.axis = .vertical
    }
}
