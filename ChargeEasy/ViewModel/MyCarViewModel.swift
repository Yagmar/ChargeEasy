//
//  MyCarViewModel.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 11/08/2024.
//

import Foundation
import Combine
import FirebaseFirestore
import Foundation
import Combine
import FirebaseFirestore

class MyCarViewModel: ObservableObject {

    @Published var myCar: ElectricCar
    @Published var newCar = ElectricCar(
        id: UUID(),  // Génère un UUID unique
        modelName: "",
        batteryCapacity: 0,
        currentBatteryLevel: 0,
        range: 0,
        consumption: 0,
        chargingStatus: "Not Charging",
        connectorType: .Tesla,
        image: ""
    )

    @Published var currentStep = 0
    @Published var showPreview = false
    @Published var showSuccessMessage = false
    
    init() {
        // Initialisation avec des données factices
        self.myCar = ElectricCar(
            id: UUID(uuidString: "550e8400-e29b-41d4-a716-446655440000") ?? UUID(),
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
    
    func saveCarToFirestore(userID: String) {
        let db = Firestore.firestore()
        do {
            // Utilisation de `newCar.id.uuidString` pour obtenir la chaîne de caractères de l'UUID
            try db.collection("users").document(userID).collection("cars").document(newCar.id.uuidString).setData(from: newCar)
            showSuccessMessage = true
        } catch let error {
            print("Error writing car to Firestore: \(error)")
        }
    }
}
