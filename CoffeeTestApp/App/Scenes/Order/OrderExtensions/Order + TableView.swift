//
//  Order + TableView.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 07.02.2024.
//

import Foundation
import UIKit

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = orderItems
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? OrderCell else {
            return UITableViewCell()
        }
        if !data.isEmpty {
            print(">>>>>>>>>>>>\(data)")
            cell.setupCell(data[indexPath.row])
            
            
            
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
}
