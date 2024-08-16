//
//  ProfileViewModel.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 13/08/2024.
//

import Foundation
import FirebaseAuth


class ProfileViewModel: ObservableObject {
    @Published var userProfile: UserProfile
    @Published var user: User? // Utilisation de votre modèle User personnalisé
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String?
    @Published var toastMessage: String? // Message à afficher dans le toast
    @Published var showToast: Bool = false // Contrôle la visibilité du toast
    @Published var isError: Bool = false // Détermine si le toast est une erreur

    init() {
        // Initialize with mock data
        self.userProfile = UserProfile(
            name: "John Doe",
            email: "john.doe@example.com",
            phoneNumber: "+1 234 567 890",
            profileImage: "profil", // Suppose que c'est le nom de l'image dans vos assets
            membershipStatus: "Gold Member",
            membershipExpiryDate: Date().addingTimeInterval(60*60*24*365) // 1 an à partir de maintenant
        )
        
        // Vérifier si un utilisateur est déjà connecté
        if let firebaseUser = Auth.auth().currentUser {
            self.user = User(from: firebaseUser)
            self.isAuthenticated = true
        }
    }
    
    // Fonction pour formater la date
    func formattedExpiryDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: userProfile.membershipExpiryDate)
    }

    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.displayToast(message: error.localizedDescription, isError: true)
            } else if let firebaseUser = result?.user {
                self?.user = User(from: firebaseUser)
                self?.isAuthenticated = true
                self?.displayToast(message: "Login successful!", isError: false)
            }
        }
    }

    func signUp(email: String, password: String, displayName: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.displayToast(message: error.localizedDescription, isError: true)
            } else if let firebaseUser = result?.user {
                // Mettre à jour le profil utilisateur avec le nom d'affichage
                let changeRequest = firebaseUser.createProfileChangeRequest()
                changeRequest.displayName = displayName
                changeRequest.commitChanges { profileError in
                    if let profileError = profileError {
                        self?.displayToast(message: profileError.localizedDescription, isError: true)
                    } else {
                        self?.user = User(from: firebaseUser)
                        self?.isAuthenticated = true
                        self?.displayToast(message: "Sign up successful!", isError: false)
                    }
                }
            }
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
            self.isAuthenticated = false
            displayToast(message: "Signed out successfully", isError: false)
        } catch let error as NSError {
            displayToast(message: error.localizedDescription, isError: true)
        }
    }

    // Fonction pour afficher un toast
    private func displayToast(message: String, isError: Bool) {
        self.toastMessage = message
        self.isError = isError
        self.showToast = true
        
        // Masquer le toast après 2 secondes
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showToast = false
        }
    }
}
