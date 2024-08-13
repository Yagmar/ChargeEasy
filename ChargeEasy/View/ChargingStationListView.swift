//
//  ChargingStationListView.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 10/08/2024.
//

import SwiftUI

struct ChargingStationListView: View {
    @StateObject private var viewModel = ChargingStationViewModel()
    @Binding var change: Bool
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(viewModel.chargingStations) { station in
                            NavigationLink(destination: ChargingStationDetailView(station: station)) {
                                HStack {
                                    Image("borne-de-recharge")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .padding(.horizontal)
                                    
                                    VStack(alignment: .leading) {
                                        Text(station.name)
                                            .font(.headline)
                                        Text("Connecteurs : \(station.connectorTypes.map { $0.rawValue }.joined(separator: ", "))")
                                        Text("Puissance : \(station.power, specifier: "%.1f") kW")
                                        Text("Temps : \(station.estimatedChargingTime, specifier: "%.2f") heures")
                                        if station.isAvailable {
                                            Text("Disponible")
                                                .foregroundColor(.green)
                                        } else {
                                            Text("Occupé")
                                                .foregroundColor(.red)
                                        }
                                    }
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .foregroundStyle(.gray)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 6)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color.black.opacity(0.1), lineWidth: 2)
                                )
                                .shadow(radius: 5)
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                // Bouton "Plan" en bas pour passer à la carte
                HStack {
                    Image(systemName: "map")
                    Text("Plan")
                }
                .padding()
                .background(Color.green.opacity(0.8))
                .clipShape(
                    RoundedRectangle(cornerRadius: 6)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black.opacity(0.1), lineWidth: 2)
                )
                .shadow(radius: 5)
                .padding()
                .onTapGesture {
                    change.toggle()
                }
            }
            .navigationTitle("Bornes de Recharge")
        }
    }
}

#Preview {
    ChargingStationListView(change: .constant(true))
}
