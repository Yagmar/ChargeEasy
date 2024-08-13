//
//  MyCarViewModel.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 11/08/2024.
//

import Foundation

class MyCarViewModel: ObservableObject {
    @Published var myCar: ElectricCar
    
    init() {
        // Initialisation avec des données factices
        self.myCar = ElectricCar(
            modelName: "Tesla Model 3",
            batteryCapacity: 75.0,
            currentBatteryLevel: 0.8, // 80%
            range: 400.0,
            consumption: 15.0, // 15 kWh/100km
            chargingStatus: "Charging",
            connectorType: .Tesla,
            image: "tesla-model-3"
        )
    }
}
