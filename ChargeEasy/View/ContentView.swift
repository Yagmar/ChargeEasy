//
//  ContentView.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 07/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: String = "Home"

    var body: some View {
        ZStack {
            // Content for the selected tab
            if selectedTab == "Home" {
                ChargingStationListView()
                
                } else if selectedTab == "MyCar" {
                Text("My Car Content")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white.edgesIgnoringSafeArea(.all))
            } else if selectedTab == "Profile" {
                Text("Profile Content")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white.edgesIgnoringSafeArea(.all))
            }

            // Custom navigation bar
            VStack {
                Spacer()
                CustomNavBar(selectedTab: $selectedTab)
                    .padding(.bottom, 10)
            }
        }
        .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
    }
}


#Preview {
    ContentView()
}

