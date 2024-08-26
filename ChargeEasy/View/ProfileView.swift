//
//  ProfileView.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 13/08/2024.
//

import SwiftUI



struct ProfileView: View {

    @EnvironmentObject var viewModel: ProfileViewModel
    var body: some View {
        ZStack {
         

            VStack(spacing: 20) {
                // Profile image
                Image(viewModel.userProfile.profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                   
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 4))
                    .shadow(radius: 10)
                    .frame(width: 150, height: 150)

                // User's name
                Text(viewModel.user?.displayName ?? viewModel.userProfile.name)
                    .font(.title)
                    .fontWeight(.bold)

                // Membership status
                Text(viewModel.userProfile.membershipStatus)
                    .font(.headline)
                    .foregroundColor(.yellow)
                
                Text("Expiry Date: \(viewModel.formattedExpiryDate())")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                // User's contact info
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.white)
                        Text(viewModel.user?.email ?? viewModel.userProfile.email)
                            .foregroundColor(.white)
                            .font(.subheadline)
                    }
                    
                    HStack {
                        Image(systemName: "phone.fill")
                            .foregroundColor(.white)
                        Text(viewModel.userProfile.phoneNumber)
                            .foregroundColor(.white)
                            .font(.subheadline)
                    }
                }
                .padding()
                .background(Color.black.opacity(0.7))
                .cornerRadius(10)
                
                Spacer()
                
                Button(action: {
                    viewModel.signOut()
                }, label: {
                    Text("Deconnexion")
                        .font(.subheadline)
                        .foregroundStyle(Color.red)
                })
                .padding()
                
//                Spacer()
                
                
             

                // Any additional profile actions or buttons can go here
            }
            .padding()
        }
        .navigationTitle("Profile")
    }
}



#Preview {
    ProfileView()
        .environmentObject(ProfileViewModel())
}
