//
//  ContentView.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 07/08/2024.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: String = "Home"
    @State var change: Bool = true
    var body: some View {
        ZStack {
            // Content for the selected tab
            VStack {
                if selectedTab == "Home" {
                    if change {
                        ChargingStationMapView(change: $change)
                    }else {
                        ChargingStationListView(change: $change)
                    }
                } else if selectedTab == "MyCar" {
                    MyCarView()
                } else if selectedTab == "Profile" {
                    ProfileView()
                }

                Spacer()
            }
            .padding(.bottom, 60) // Ensure content doesn't overlap the navbar
            
            // Custom navigation bar
            VStack {
                Spacer()
                CustomNavBar(selectedTab: $selectedTab)
            }
        }
        .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
    }
}



#Preview {
    ContentView()
}

