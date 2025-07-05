//
//  LocationHelper.swift
//  Take Me Home
//
//  Created by Ryan Dolan on 9/17/24.
//


import Foundation
import CoreLocation

enum LocationHelper {
    struct LocationAnnotation: Identifiable {
        let id = UUID()
        let coordinate: CLLocationCoordinate2D
    }
}