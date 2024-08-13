//
//  BatteryView.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 11/08/2024.
//

import SwiftUI

struct BatteryView: View {
    let batteryLevel: Double // Battery level as a percentage (0.0 to 1.0)
    let range: Double // Range in kilometers or miles

    var body: some View {
        VStack(alignment: .leading) {
            Text("Battery")
                .font(.headline)
                .foregroundStyle(.white)
                .padding(.bottom, 2)

            Text("Last charge 2w ago")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 10)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("\(Int(range)) km")
                        .font(.title)
                        .foregroundColor(.green)

                    Text("\(Int(batteryLevel * 100))%")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                BatteryGauge(batteryLevel: batteryLevel)
                    .frame(width: 50, height: 100)
            }
            .padding()
           
            .cornerRadius(10)
        }
        .padding()
        .background(Color.black.opacity(0.7))
        .cornerRadius(10)
    }
}
struct BatteryGauge: View {
    let batteryLevel: Double // Battery level as a percentage (0.0 to 1.0)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(.gray.opacity(0.3))

                RoundedRectangle(cornerRadius: 5)
                    .frame(width: geometry.size.width, height: CGFloat(batteryLevel) * geometry.size.height)
                    .foregroundColor(.green)
            }
        }
    }
}

#Preview {
    BatteryView(batteryLevel: 0.5, range: 400.0)
}
