//
//  ChargingStationViewModel.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 10/08/2024.
//

import Foundation
import Combine

class ChargingStationViewModel: ObservableObject {
    @Published var chargingStations: [ChargingStation] = []

    init() {
        loadMockData()
    }

    private func loadMockData() {
        // Simulation des données (Mock Data) pour les bornes de recharge
        let batteryCapacity = 75.0 // Capacité de la batterie en kWh (par exemple pour une Tesla Model 3)
        let currentBatteryLevel = 0.2 // 20% de batterie restante

        self.chargingStations = [
            // Stations à Paris
            ChargingStation(
                name: "Station 1",
                latitude: 48.8738,
                longitude: 2.2950,
                connectorType: .CCS2,
                power: 50.0,
                chargingType: .DC,
                isAvailable: true,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Située près de l'Arc de Triomphe, cette station offre une recharge rapide en courant continu avec une puissance de 50 kW."
            ),
            ChargingStation(
                name: "Station 2",
                latitude: 48.8584,
                longitude: 2.2945,
                connectorType: .Type2,
                power: 22.0,
                chargingType: .AC,
                isAvailable: true,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Une station Type 2 située juste à côté de la Tour Eiffel, idéale pour une recharge lente en courant alternatif."
            ),
            ChargingStation(
                name: "Station 3",
                latitude: 48.8606,
                longitude: 2.3376,
                connectorType: .CHAdeMO,
                power: 50.0,
                chargingType: .DC,
                isAvailable: false,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Profitez d'une recharge rapide en courant continu au Musée du Louvre avec cette borne CHAdeMO."
            ),
            ChargingStation(
                name: "Station 4",
                latitude: 48.8529,
                longitude: 2.3508,
                connectorType: .Tesla,
                power: 120.0,
                chargingType: .DC,
                isAvailable: true,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Rechargez rapidement votre véhicule Tesla près de Notre-Dame de Paris avec une puissance de 120 kW."
            ),
            ChargingStation(
                name: "Station 5",
                latitude: 48.8648,
                longitude: 2.3292,
                connectorType: .CCS2,
                power: 150.0,
                chargingType: .DC,
                isAvailable: true,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Station de recharge ultra-rapide près de l'Opéra Garnier, offrant une puissance de 150 kW en CCS2."
            ),
            ChargingStation(
                name: "Station 6",
                latitude: 48.8462,
                longitude: 2.3371,
                connectorType: .Type2,
                power: 22.0,
                chargingType: .AC,
                isAvailable: false,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Rechargez votre véhicule électrique en courant alternatif au Jardin du Luxembourg."
            ),
            ChargingStation(
                name: "Station 7",
                latitude: 48.8665,
                longitude: 2.3135,
                connectorType: .CHAdeMO,
                power: 50.0,
                chargingType: .DC,
                isAvailable: true,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Recharge rapide CHAdeMO disponible au Grand Palais."
            ),
            ChargingStation(
                name: "Station 8",
                latitude: 48.8530,
                longitude: 2.3499,
                connectorType: .Tesla,
                power: 120.0,
                chargingType: .DC,
                isAvailable: true,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Recharge Tesla haute puissance sur l'Île de la Cité, au cœur de Paris."
            ),
            ChargingStation(
                name: "Station 9",
                latitude: 48.8721,
                longitude: 2.3018,
                connectorType: .CCS2,
                power: 50.0,
                chargingType: .DC,
                isAvailable: false,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Station de recharge rapide CCS2 située sur les Champs-Élysées."
            ),
            ChargingStation(
                name: "Station 10",
                latitude: 48.8590,
                longitude: 2.3266,
                connectorType: .Type2,
                power: 22.0,
                chargingType: .AC,
                isAvailable: true,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Recharge en courant alternatif disponible à la Place de la Concorde."
            ),
            
            // Stations à San Francisco
            ChargingStation(
                name: "Station 11",
                latitude: 37.7749,
                longitude: -122.4194,
                connectorType: .CCS2,
                power: 50.0,
                chargingType: .DC,
                isAvailable: true,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Station de recharge rapide en courant continu au cœur de San Francisco."
            ),
            ChargingStation(
                name: "Station 12",
                latitude: 37.8087,
                longitude: -122.4098,
                connectorType: .Type2,
                power: 22.0,
                chargingType: .AC,
                isAvailable: false,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Rechargez en courant alternatif près de Fisherman's Wharf."
            ),
            ChargingStation(
                name: "Station 13",
                latitude: 37.7793,
                longitude: -122.4193,
                connectorType: .Tesla,
                power: 120.0,
                chargingType: .DC,
                isAvailable: true,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Recharge Tesla à haute puissance à Union Square."
            ),
            ChargingStation(
                name: "Station 14",
                latitude: 37.8024,
                longitude: -122.4058,
                connectorType: .CHAdeMO,
                power: 50.0,
                chargingType: .DC,
                isAvailable: true,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Station CHAdeMO rapide à North Beach, San Francisco."
            ),
            ChargingStation(
                name: "Station 15",
                latitude: 37.7648,
                longitude: -122.4630,
                connectorType: .CCS2,
                power: 150.0,
                chargingType: .DC,
                isAvailable: false,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Recharge ultra-rapide au Golden Gate Park, parfaite pour les longs trajets."
            ),
            ChargingStation(
                name: "Station 16",
                latitude: 37.7936,
                longitude: -122.3958,
                connectorType: .Type2,
                power: 22.0,
                chargingType: .AC,
                isAvailable: true,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Recharge en courant alternatif à Embarcadero Center."
            ),
            ChargingStation(
                name: "Station 17",
                latitude: 37.7599,
                longitude: -122.4148,
                connectorType: .Tesla,
                power: 120.0,
                chargingType: .DC,
                isAvailable: true,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Station Tesla haute puissance dans le quartier Mission District."
            ),
            ChargingStation(
                name: "Station 18",
                latitude: 37.7955,
                longitude: -122.3937,
                connectorType: .CHAdeMO,
                power: 50.0,
                chargingType: .DC,
                isAvailable: true,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Recharge rapide CHAdeMO près de Ferry Building."
            ),
            ChargingStation(
                name: "Station 19",
                latitude: 37.7338,
                longitude: -122.4467,
                connectorType: .CCS2,
                power: 50.0,
                chargingType: .DC,
                isAvailable: true,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Station CCS2 dans le quartier de Sunset District."
            ),
            ChargingStation(
                name: "Station 20",
                latitude: 37.8083,
                longitude: -122.4175,
                connectorType: .Type2,
                power: 22.0,
                chargingType: .AC,
                isAvailable: false,
                batteryCapacity: batteryCapacity,
                currentBatteryLevel: currentBatteryLevel,
                description: "Recharge en courant alternatif à proximité du Pier 39."
            )
        ]

    }
}
