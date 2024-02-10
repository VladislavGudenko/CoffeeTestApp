//
//  OrderViewController.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 07.02.2024.
//

import Foundation
import UIKit

class OrderViewController: UIViewController, OrderViewProtocol {
    
    var presenter: OrderPresenterProtocol?
    var orderItems: [OrderEntity] = []
    
    let tableView = UITableView()
    let makeOrderButton = CustomBigButton(frame: .zero,
                                          buttonTitle: Strings.makeOrder.rawValue)
    let descriptionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateOrderItems(with: orderItems)
        setupNavBar()
        setupUI()
        addSubviews()
        setupButtons()
    }
    
    @objc func makeOrderTap() {
        orderConfirmation()
    }
    
    func setupNavBar() {
        self.navigationItem.title = Strings.order.rawValue
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = MainColors.navigationBarColor
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = MainColors.navigationBarColor
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    func updateOrderItems(with newOrderItems: [OrderEntity]) {
        var uniqueOrderItems: [OrderEntity] = []
        for newOrderItem in newOrderItems {
            if let existingIndex = uniqueOrderItems.lastIndex(where: { $0.id == newOrderItem.id }) {
                uniqueOrderItems[existingIndex] = newOrderItem
            } else {
                uniqueOrderItems.append(newOrderItem)
            }
        }
        orderItems = uniqueOrderItems
        
        tableView.reloadData()
    }
    
    func setupButtons() {
        makeOrderButton.addTarget(self, action: #selector(makeOrderTap), for: .touchUpInside)
    }
    
    func orderConfirmation() {
        if !orderItems.isEmpty {
            let alertController = UIAlertController(title: Strings.order.rawValue,
                                                    message: Strings.gratzOrder.rawValue,
                                                    preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: Strings.cancel.rawValue,
                                             style: .cancel,
                                             handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: Strings.order.rawValue,
                                                    message: Strings.errorDialog.rawValue,
                                                    preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: Strings.cancel.rawValue,
                                             style: .cancel,
                                             handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
    }
}
