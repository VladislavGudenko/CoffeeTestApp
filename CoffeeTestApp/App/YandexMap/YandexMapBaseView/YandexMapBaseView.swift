//
//  YandexMapBaseView.swift
//  CoffeeTestApp
//
//  Created by Владислав Гуденко on 06.02.2024.
//

import Foundation
import YandexMapsMobile

class YandexMapBaseView: UIView {
    
    @objc public var mapView: YMKMapView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    private func setup() {
        mapView = YMKMapView(frame: bounds, vulkanPreferred: YandexMapBaseView.isM1Simulator())
        mapView.mapWindow.map.mapType = .map
    }
    
    static func isM1Simulator() -> Bool {
        return (TARGET_IPHONE_SIMULATOR & TARGET_CPU_ARM64) != 0
    }
}
