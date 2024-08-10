//
//  ChargingStationListView.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 10/08/2024.
//

import SwiftUI



struct ChargingStationListView: View {
    @StateObject private var viewModel = ChargingStationViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.chargingStations) { station in
                        NavigationLink(destination: ChargingStationDetailView()) {
                            HStack {
                                Image("borne-de-recharge")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .padding(.horizontal)
                                
                                VStack(alignment: .leading) {
                                    Text(station.name)
                                        .font(.headline)
                                    Text("Connecteur : \(station.connectorType.rawValue)")
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
                            }
                            .frame(width: 320)
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
            .navigationTitle("Bornes de Recharge")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ChargingStationMapView().navigationBarBackButtonHidden(true)) {
                        HStack {
                            Image(systemName: "map")
                            Text("Plan")
                        }
                        .padding(5)
                        .background(Color.green.opacity(0.8))
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
        }
    }
}


#Preview {
    ChargingStationListView()
}
