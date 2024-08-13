//
//  ElectricCar.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 11/08/2024.
//

import Foundation

struct ElectricCar {
    let modelName: String
    let batteryCapacity: Double // en kWh
    let currentBatteryLevel: Double // en pourcentage
    let range: Double // en kilomètres
    let consumption: Double // en kWh/100km
    let chargingStatus: String // "Charging", "Not Charging", etc.
    let connectorType: ConnectorType // Type 2, CCS2, etc.
    let image: String // Nom de l'image de la voiture
}

