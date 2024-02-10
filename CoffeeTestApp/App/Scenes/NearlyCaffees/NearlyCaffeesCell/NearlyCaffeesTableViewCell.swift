//
//  NearlyCaffeesTableViewCell.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 05.02.2024.
//

import Foundation
import UIKit

class NearlyCaffeesTableViewCell: UITableViewCell {
    
    let labelName = UILabel()
    let distanceLabel = UILabel()
    
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
        distanceLabel.textColor = MainColors.navigationBarTitleColor
        distanceLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(distanceLabel)
        distanceLabel.snp.makeConstraints { make in
            make.top.equalTo(labelName.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(10)
        }
    }
    
    func setupCell(_ data: LocationsEntity) {
        labelName.text = data.name
    }
}
