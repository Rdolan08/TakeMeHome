//
//  LocationAnnotation.swift
//  Take Me Home
//
//  Created by Ryan Dolan on 9/17/24.
//


import SwiftUI
import MapKit

struct LocationAnnotation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}