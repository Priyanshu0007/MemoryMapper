//
//  Memory.swift
//  MemoryMapper
//
//  Created by Priyanshu Gupta on 02/07/26.
//

import Foundation
import SwiftData
import CoreLocation

@Model
class Memory: Identifiable{
    var id: UUID
    var title: String
    var latitude: Double
    var longitude: Double
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.id = UUID()
        self.title = title
        self.latitude = coordinate.latitude
        self.longitude = coordinate.longitude
    }
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

