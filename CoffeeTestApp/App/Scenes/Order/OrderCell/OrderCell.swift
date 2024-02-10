//
//  OrderCell.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 07.02.2024.
//

import Foundation
import UIKit

class OrderCell: UITableViewCell {
    
    var count: Int?
    var identifier: String?
    var menuItem: MenuEntity?
    var orderEntity: OrderEntity?
    
    let labelName = UILabel()
    let costLabel = UILabel()
    let minusButton = UIButton()
    let currentCountLabel = UILabel()
    let plusButton = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        configureCell()
        setupLabels()
    }
    
    private func configureCell() {
        selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = MainColors.cellBackground
    
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
    }
    
    func setupLabels() {
        labelName.textColor = UIColor(named: "customBrown")
        labelName.font = UIFont.systemFont(ofSize: 18)
        contentView.addSubview(labelName)
        
        labelName.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(10)
        }
        costLabel.textColor = MainColors.navigationBarTitleColor
        costLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(costLabel)
        costLabel.snp.makeConstraints { make in
            make.top.equalTo(labelName.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(10)
//            make.bottom.equalToSuperview().inset(20)
        }
        currentCountLabel.textColor = MainColors.navigationBarTitleColor
        currentCountLabel.font = UIFont.systemFont(ofSize: 14)
        minusButton.setImage(UIImage(named: "minusIconBrown"), for: .normal)
        plusButton.setImage(UIImage(named: "plusIconBrown"), for: .normal)
        setupButtons()
        
        contentView.addSubview(minusButton)
        contentView.addSubview(currentCountLabel)
        contentView.addSubview(plusButton)
        
        minusButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(60)
            make.centerY.equalToSuperview()
        }
        currentCountLabel.snp.makeConstraints { make in
            make.leading.equalTo(minusButton.snp.trailing)
            make.centerY.equalToSuperview()
        }
        plusButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
        
    }
    
    func setupCell(_ data: OrderEntity) {
        labelName.text = data.menuEntity.name
        costLabel.text = "\((data.menuEntity.price ?? 0) * data.quantity) руб"
        currentCountLabel.text = "\(data.quantity)"
        orderEntity = data
    }
    
    func setupButtons() {
        minusButton.addTarget(self, action: #selector(minusTap), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusTap), for: .touchUpInside)
    }
    
    @objc func minusTap() {
        if orderEntity?.quantity != 0 {
            orderEntity?.quantity -= 1
            updateLabel()
        }
    }
    
    @objc func plusTap() {
        orderEntity?.quantity += 1
        updateLabel()
    }
    
    func updateLabel() {
        guard let count = orderEntity?.quantity,
              let totalPrice = orderEntity?.menuEntity.price else {
            return
        }
        currentCountLabel.text = "\(count)"
        costLabel.text = "\(totalPrice * count) руб"
    }
}
