import SwiftUI
import MapKit
import CoreLocation

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region: MKCoordinateRegion
    @Published var currentLocation: CLLocation?
    private var locationManager: CLLocationManager?
    
    override init() {
        locationManager = CLLocationManager()
        self.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 45.11183700335066, longitude: -93.43851344737402),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        super.init()
        
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func startUpdatingLocation() {
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        currentLocation = location
        updateLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    }
    
    func simulateLocation(latitude: Double, longitude: Double) {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        currentLocation = location
        locationManager(locationManager!, didUpdateLocations: [location])
        updateLocation(latitude: latitude, longitude: longitude)
    }

    // Function to update the region with a new location asynchronously
    func setRegion(newRegion: MKCoordinateRegion) {
        DispatchQueue.main.async {
            self.region = newRegion
        }
    }

    // Helper method to create a new MKCoordinateRegion based on latitude and longitude
    func updateLocation(latitude: Double, longitude: Double) {
        let newRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        setRegion(newRegion: newRegion)
    }
}
