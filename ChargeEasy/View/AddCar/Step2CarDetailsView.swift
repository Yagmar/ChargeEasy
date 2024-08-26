//
//  Step2CarDetailsView.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 19/08/2024.
//

import SwiftUI

struct Step2CarDetailsView: View {
    @Binding var car: ElectricCar

    var body: some View {
        VStack {
            Text("Step 2: Enter Car Details")
                .font(.title)
                .padding(.top, 40)
            
            TextField("Model Name", text: $car.modelName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
                .padding()
            
            TextField("Battery Capacity (kWh)", value: $car.batteryCapacity, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Range (km)", value: $car.range, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Picker("Connector Type", selection: $car.connectorType) {
                ForEach(ConnectorType.allCases, id: \.self) { type in
                    Text(type.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
        .padding()
        .background(Color(UIColor.systemGroupedBackground))
    }
}

#Preview {
    Step2CarDetailsView(car: .constant( ElectricCar(
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
