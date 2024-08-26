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
        ZStack(alignment: .bottom) {
            if authViewModel.isAuthenticated {
                VStack(spacing: 0) {
                    if selectedTab == "Home" {
                        if change {
                            ChargingStationMapView(change: $change)
                                .edgesIgnoringSafeArea(.all)
                        } else {
                            ChargingStationListView(change: $change)
                        }
                    } else if selectedTab == "MyCar" {
                        MyCarView()
                    } else if selectedTab == "Profile" {
                        ProfileView()
                            .environmentObject(ProfileViewModel())
                    }
                }
                .padding(.bottom, 60) // Assurez-vous que le contenu ne chevauche pas la CustomNavBar

                // Custom navigation bar
                CustomNavBar(selectedTab: $selectedTab)
                    .padding(.bottom, 10) // Ajuste l'espace en bas pour que la barre de navigation ne soit pas trop basse
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

