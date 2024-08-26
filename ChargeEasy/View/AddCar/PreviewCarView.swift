//
//  PreviewCarView.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 19/08/2024.
//

import SwiftUI



struct PreviewCarView: View {
    var car: ElectricCar
    var onEdit: () -> Void
    var onSave: () -> Void
    
    var body: some View {
        VStack {
            Text("Preview")
                .font(.title)
                .padding()
            
            Image(car.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .shadow(radius: 10)
                .padding()
            
            Text("Model: \(car.modelName)")
                .padding()
            Text("Battery Capacity: \(car.batteryCapacity, specifier: "%.1f") kWh")
                .padding()
            Text("Range: \(car.range, specifier: "%.0f") km")
                .padding()
            Text("Connector Type: \(car.connectorType.rawValue)")
                .padding()
            
            HStack {
                Button("Edit") {
                    onEdit()
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Spacer()
                
                Button("Save") {
                    onSave()
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
        }
    }
}

#Preview {
    PreviewCarView(
        car: ElectricCar(
            id: UUID(),
            modelName: "Tesla Model S",
            batteryCapacity: 100.0,
            currentBatteryLevel: 0.9,
            range: 500.0,
            consumption: 20.0,
            chargingStatus: "Charging",
            connectorType: .Tesla,
            image: "tesla-model-s"  // Assurez-vous d'avoir une image avec ce nom dans vos assets
        ),
        onEdit: {
            print("Edit button pressed")
        },
        onSave: {
            print("Save button pressed")
        }
    )
}
