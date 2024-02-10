//
//  Menu + CollectionView.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 07.02.2024.
//

import Foundation
import UIKit

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        response.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                         for: indexPath) as? MenuCollectionViewCell {
            guard let photo = response[indexPath.row].imageURL else {
                return UICollectionViewCell()
            }
            cell.quantity = 0

            cell.action = { [weak self] item in
                self?.orderEntity.append(item)
            }
            
            let data = getData()
            cell.setupCell(stringImage: photo, data: data[indexPath.row])
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 16.0
        let width = (collectionView.frame.width - 3 * spacing) / 2
        return CGSize(width: width, height: width * 1.5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if UIApplication.shared.statusBarOrientation.isLandscape {
            return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        }
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
}
