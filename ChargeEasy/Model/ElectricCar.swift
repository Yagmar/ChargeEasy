//
//  ElectricCar.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 11/08/2024.
//

import Foundation

struct ElectricCar:  Codable, Identifiable {
    let id: UUID
    var modelName: String
    var batteryCapacity: Double // en kWh
    var currentBatteryLevel: Double // en pourcentage
    var range: Double // en kilomètres
    var consumption: Double // en kWh/100km
    var chargingStatus: String // "Charging", "Not Charging", etc.
    var connectorType: ConnectorType // Type 2, CCS2, etc.
    var image: String // Nom de l'image de la voiture
    
    init(id: UUID, modelName: String, batteryCapacity: Double, currentBatteryLevel: Double, range: Double, consumption: Double, chargingStatus: String, connectorType: ConnectorType, image: String) {
        self.id = id
        self.modelName = modelName
        self.batteryCapacity = batteryCapacity
        self.currentBatteryLevel = currentBatteryLevel
        self.range = range
        self.consumption = consumption
        self.chargingStatus = chargingStatus
        self.connectorType = connectorType
        self.image = image
    }
}
