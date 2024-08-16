//
//  LocationManager.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 10/08/2024.
//


import Foundation
import CoreLocation
import MapKit
import Combine


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    
    @Published var currentLocation: CLLocationCoordinate2D?
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Default to San Francisco
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @Published var address: String?
    @Published var locationError: Error?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        // Update the current location and the region
        DispatchQueue.main.async {
            self.currentLocation = location.coordinate
            self.region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
            self.reverseGeocode(location: location) // Get the address
        }
        
        print("New location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get user location: \(error.localizedDescription)")
        DispatchQueue.main.async {
            self.locationError = error
        }
    }

    private func reverseGeocode(location: CLLocation) {
        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            if let error = error {
                DispatchQueue.main.async {
                    self?.locationError = error
                }
            } else if let placemark = placemarks?.first {
                DispatchQueue.main.async {
                    self?.address = [placemark.name, placemark.locality, placemark.administrativeArea, placemark.country]
                        .compactMap { $0 }
                        .joined(separator: ", ")
                }
            }
        }
    }
}
