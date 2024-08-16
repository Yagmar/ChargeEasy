//
//  ContentView.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 07/08/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authViewModel = ProfileViewModel()
    @State private var selectedTab: String = "Home"
    @State var change: Bool = true

    var body: some View {
        ZStack (alignment: .top) {
            if authViewModel.isAuthenticated {
                // Afficher le contenu principal si l'utilisateur est authentifié
                VStack {
                    if selectedTab == "Home" {
                        if change {
                            ChargingStationMapView(change: $change)
                        } else {
                            ChargingStationListView(change: $change)
                        }
                    } else if selectedTab == "MyCar" {
                        MyCarView()
                    } else if selectedTab == "Profile" {
                        ProfileView()
                            .environmentObject(ProfileViewModel())
                    }

                    Spacer()
                }
                .padding(.bottom, 60) // Ensure content doesn't overlap the navbar

                // Custom navigation bar
                VStack {
                    Spacer()
                    CustomNavBar(selectedTab: $selectedTab)
                }
            } else {
                // Afficher la vue d'authentification si l'utilisateur n'est pas authentifié
                AuthView()
                    .environmentObject(authViewModel)
            }
            
            if authViewModel.showToast, let message = authViewModel.toastMessage {
                ToastView(message: message, isError: authViewModel.isError)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .animation(.easeInOut)
            }

        }
      
        .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
    }
}


#Preview {
    ContentView()
}

