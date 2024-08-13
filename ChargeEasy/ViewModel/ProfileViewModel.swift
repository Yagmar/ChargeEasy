//
//  ProfileViewModel.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 13/08/2024.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var userProfile: UserProfile
    
    init() {
        // Initialize with mock data
        self.userProfile = UserProfile(
            name: "John Doe",
            email: "john.doe@example.com",
            phoneNumber: "+1 234 567 890",
            profileImage: "profil", // Assume this is the name of the image in your assets
            membershipStatus: "Gold Member",
            membershipExpiryDate: Date().addingTimeInterval(60*60*24*365) // 1 year from now
        )
    }
    
    // Function to format the date
    func formattedExpiryDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: userProfile.membershipExpiryDate)
    }
}
