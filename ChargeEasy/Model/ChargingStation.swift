//
//  ChargingStation.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 10/08/2024.
//

import Foundation
import CoreLocation

enum ChargingType {
    case AC
    case DC
}



struct ChargingStation: Identifiable {
    var id = UUID()
    var name: String
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    var connectorTypes: [ConnectorType]
    var power: Double // Puissance en kW
    var chargingType: ChargingType // AC ou DC
    var isAvailable: Bool
    var estimatedChargingTime: Double // Temps de recharge en heures
    var description: String // Description de la station
    var rating: Double // Évaluation moyenne
    var reviews: [String] // Commentaires des utilisateurs
    var imageURL: String? // URL pour une image de la station
    var lastUpdated: Date // Dernière mise à jour de la disponibilité
    var address: String // Adresse de la station
    var cost: Double // Coût par kWh
    var recentReview: String // Commentaire récent

    init(name: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees, connectorTypes: [ConnectorType], power: Double, chargingType: ChargingType, isAvailable: Bool, batteryCapacity: Double, currentBatteryLevel: Double, description: String, rating: Double, reviews: [String], imageURL: String?, lastUpdated: Date, address: String, cost: Double, recentReview: String) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.connectorTypes = connectorTypes
        self.power = power
        self.chargingType = chargingType
        self.isAvailable = isAvailable
        self.description = description
        self.rating = rating
        self.reviews = reviews
        self.imageURL = imageURL
        self.lastUpdated = lastUpdated
        self.address = address
        self.cost = cost
        self.recentReview = recentReview

        // Calcul du temps de recharge estimé
        let remainingCapacity = batteryCapacity * (1.0 - currentBatteryLevel) // Capacité restante en kWh
        self.estimatedChargingTime = remainingCapacity / power // Temps en heures
    }

    // Méthode pour calculer le coût en fonction de la puissance de la borne
    func calculatePrice(for capacity: Double = 50.0) -> (Double, Double) {
        let minPricePerKWh: Double
        let maxPricePerKWh: Double
        
        switch power {
        case 7...22: // Borne lente
            minPricePerKWh = 0.20
            maxPricePerKWh = 0.30
        case 50: // Borne rapide
            minPricePerKWh = 0.40
            maxPricePerKWh = 0.60
        case 150...: // Borne ultra-rapide
            minPricePerKWh = 0.60
            maxPricePerKWh = 0.70
        default:
            minPricePerKWh = 0.50 // Valeur par défaut
            maxPricePerKWh = 0.50
        }
        
        let minTotalPrice = minPricePerKWh * capacity
        let maxTotalPrice = maxPricePerKWh * capacity
        
        return (minTotalPrice, maxTotalPrice)
    }
}

