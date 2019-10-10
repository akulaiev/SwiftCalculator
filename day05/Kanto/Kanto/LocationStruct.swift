//
//  LocationStruct.swift
//  Kanto
//
//  Created by Anna KULAIEVA on 10/8/19.
//  Copyright © 2019 Anna KULAIEVA. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

struct Location {
    
    let title: String
    let latitude: Double
    let longitude: Double
    let location: CLLocationCoordinate2D
    let color: UIColor
    
    init(title: String, latitude: Double, longitude: Double, color: UIColor) {
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
        self.location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.color = color
    }
}
