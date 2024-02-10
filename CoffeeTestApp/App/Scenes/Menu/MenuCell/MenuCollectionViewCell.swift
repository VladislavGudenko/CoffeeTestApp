//
//  MenuTableViewCell.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 07.02.2024.
//

import Foundation
import UIKit
import Kingfisher

class MenuCollectionViewCell: UICollectionViewCell {
    
    var menuItem: MenuEntity?
    weak var orderViewController: OrderViewController?
    var quantity: UInt = 0
    
    var action: ((OrderEntity) -> Void)?
    
    let image = UIImageView()
    let coffeeNameLabel = UILabel()
    let priceLabel = UILabel()
    let minusButton = UIButton()
    let currentCountLabel = UILabel()
    let plusButton = UIButton()
    var count: Int = 0
    
    let mainStackView = UIStackView()
    let bottomStackView = UIStackView()
    let spacingView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        setupUI()
        setupButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
        setupLayouts()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
    }
    
    private func configureCell() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .white
        
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowRadius = 8
    }
    
    func setupCell(stringImage: String, data: MenuEntity) {
        guard let url = URL(string: "\(stringImage)") else { return }
        guard let price = data.price else { return }
        self.image.kf.indicatorType = .activity
        self.image.kf.setImage(with: url)
        coffeeNameLabel.text = data.name
        priceLabel.text = "\(price) руб"
        currentCountLabel.text = "\(count)"
        menuItem = data
    }
    
    func setupButtons() {
        minusButton.addTarget(self, action: #selector(minusTap), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusTap), for: .touchUpInside)
    }
    
    @objc func minusTap() {
        if count != 0 {
            count -= 1
            updateLabel()
            if let menuItem = menuItem {
                action?(OrderEntity(menuEntity: menuItem,
                                    quantity: count,
                                    id: menuItem.id ?? 0))
            }
        }
    }
    
    @objc func plusTap() {
        count += 1
        updateLabel()
        if let menuItem = menuItem {
            action?(OrderEntity(menuEntity: menuItem,
                                quantity: count,
                                id: menuItem.id ?? 0))
        }
    }
    
    func updateLabel() {
        currentCountLabel.text = "\(count)"
    }
}
