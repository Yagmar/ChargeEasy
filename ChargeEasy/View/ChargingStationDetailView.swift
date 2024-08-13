//
//  ChargingStationDetailView.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 10/08/2024.
//

import SwiftUI


struct ChargingStationDetailView: View {
    var station: ChargingStation
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Image of the station
                Image("borne") // Replace with actual image name or URL
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                
                // Station name and location
                VStack(alignment: .leading, spacing: 10) {
                    Text(station.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    HStack {
                        Image(systemName: "location.fill")
                            .foregroundColor(.gray)
                        Text(station.address)
                            .foregroundColor(.gray)
                    }
                }
                
                Divider()
                
                // Connector types and availability
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Text("Connectors:")
                            .font(.headline)
                        
                        Spacer()
                        
                        ForEach(station.connectorTypes, id: \.self) { connector in
                            HStack {
                                Image(systemName: "bolt.fill")
                                    .foregroundColor(.green)
                                Text(connector.rawValue)
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 2)
                                    .background(Color.green.opacity(0.2))
                                    .cornerRadius(5)
                            }
                        }
                    }
                    
                    HStack {
                        Text("Availability:")
                            .font(.headline)
                        Spacer()
                        Text(station.isAvailable ? "Available" : "Occupied")
                            .foregroundColor(station.isAvailable ? .green : .red)
                    }
                    
                    HStack {
                        Text("Charging Power:")
                            .font(.headline)
                        Spacer()
                        Text("\(station.power, specifier: "%.1f") kW")
                            .foregroundColor(.black)
                    }
                    
                    HStack {
                        Text("Estimated Charge Time:")
                            .font(.headline)
                        Spacer()
                        Text("\(station.estimatedChargingTime, specifier: "%.2f") hours")
                            .foregroundColor(.black)
                    }
                    
                    HStack {
                        Text("Cost:")
                            .font(.headline)
                        Spacer()
                        Text("\(station.cost, specifier: "%.2f") €/kWh")
                            .foregroundColor(.black)
                    }
                }
                
                Divider()
                
                // Ratings and reviews (simulated)
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("User Rating:")
                            .font(.headline)
                        
                        Spacer()
                        
                        HStack(spacing: 5) {
                            ForEach(0..<5) { index in
                                Image(systemName: index < Int(station.rating) ? "star.fill" : "star")
                                    .foregroundColor(.yellow)
                            }
                            Text("(\(Int(station.rating)))")
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Text("Recent Review:")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text(station.recentReview)
                        .font(.body)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }
                
                Spacer()
                
                // Action buttons
                HStack(spacing: 20) {
                    Button(action: {
                        // Navigate to station
                    }) {
                        HStack {
                            Image(systemName: "map.fill")
                            Text("Navigate")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        // Reserve the station
                    }) {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                            Text("Reserve")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
            .navigationTitle("Station Details")
        }
    }
}

#Preview {
    ChargingStationDetailView(station: ChargingStation(
        name: "Central Park Station",
        latitude: 40.785091,
        longitude: -73.968285,
        connectorTypes: [.CCS2, .Type2],
        power: 50.0,
        chargingType: .DC,
        isAvailable: true,
        batteryCapacity: 75.0,
        currentBatteryLevel: 0.5,
        description: "A convenient charging station located near Central Park.",
        rating: 4.5,
        reviews: ["Great station, easy to find and very fast charging!"],
        imageURL: nil,
        lastUpdated: Date(),
        address: "123 Main St, Anytown",
        cost: 0.25,
        recentReview: "Great station, easy to find and very fast charging!"
    ))
}
