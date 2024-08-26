//
//  Step3CarSummaryView.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 19/08/2024.
//

import SwiftUI

import SwiftUI

struct Step3CarSummaryView: View {
    @Binding var car: ElectricCar
    
    var body: some View {
        VStack {
            Text("Step 3: Summary")
                .font(.title)
                .padding()
            
            Text("Model: \(car.modelName)")
                .padding()
            Text("Battery Capacity: \(car.batteryCapacity, specifier: "%.1f") kWh")
                .padding()
            Text("Range: \(car.range, specifier: "%.0f") km")
                .padding()
            Text("Connector Type: \(car.connectorType.rawValue)")
                .padding()
        }
    }
}


#Preview {
    Step3CarSummaryView(car: .constant( ElectricCar(
        id: UUID(),
        modelName: "Tesla Model S",
        batteryCapacity: 100.0,
        currentBatteryLevel: 0.9,
        range: 500.0,
        consumption: 20.0,
        chargingStatus: "Charging",
        connectorType: .Tesla,
        image: "tesla-model-s"  // Assurez-vous d'avoir une image avec ce nom dans vos assets
    )))
}
