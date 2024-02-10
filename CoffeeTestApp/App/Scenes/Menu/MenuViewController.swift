//
//  MenuViewController.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 07.02.2024.
//

import Foundation
import UIKit

class MenuViewController: UIViewController, MenuViewProtocol {
    
    var presenter: MenuPresenterProtocol?
        
    var orderEntity: [OrderEntity] = []
    
    var response: [MenuEntity] = []
    
    let collectionView = UICollectionView(frame: CGRect.zero,
                                          collectionViewLayout: UICollectionViewFlowLayout.init())
    let paymentButton = CustomBigButton(frame: .zero,
                                        buttonTitle: Strings.doPayment.rawValue)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        setupNavBar()
        setupUI()
        addSubviews()
    }
    
    func setupNavBar() {
        self.navigationItem.title = Strings.menu.rawValue
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = MainColors.navigationBarColor
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = MainColors.navigationBarColor
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    func displayMenu(_ menuItems: [MenuEntity]) {
        response = menuItems
        reloadData()
    }
    
    @objc func paymentTap() {
        presenter?.openOrderScene(from: self, with: orderEntity)
    }
    
    func getData() -> [MenuEntity] {
        response
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
}
