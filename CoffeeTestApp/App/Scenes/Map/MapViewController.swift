//
//  MapViewController.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 06.02.2024.
//

import Foundation
import UIKit
import YandexMapsMobile

class MapViewController: UIViewController, YMKClusterListener, YMKClusterTapListener, MapViewProtocol {
    
    lazy var mapView: YMKMapView = YandexMapBaseView().mapView
    var presenter: MapPresenterProtocol?
    var locations: [LocationsEntity] = []
    var points: [YMKPoint] = []
    
    let PLACEMARKS_NUMBER = 2000
    let FONT_SIZE: CGFloat = 15
    let MARGIN_SIZE: CGFloat = 3
    let STROKE_SIZE: CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        addSubviews()
        setupLayouts()
        self.addPlacemarkOnMap()
    }
    
    func setupNavBar() {
        self.navigationItem.title = Strings.map.rawValue
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = MainColors.navigationBarColor
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = MainColors.navigationBarColor
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
}
