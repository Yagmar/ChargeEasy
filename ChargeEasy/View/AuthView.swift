//
//  AuthView.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 15/08/2024.
//

import SwiftUI

struct AuthView: View {
    @State private var isLoginMode: Bool = true
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var fullName = ""
    @EnvironmentObject var viewModel: ProfileViewModel

    var body: some View {
        ZStack {
            Image("background") // Remplacer par l'image de fond appropriée
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                Text(isLoginMode ? "Welcome back" : "Register")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                
                VStack(spacing: 20) {
                    if !isLoginMode {
                        TextField("Full Name", text: $fullName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(8)
                    }
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(8)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(8)
                    
                    if !isLoginMode {
                        SecureField("Confirm Password", text: $confirmPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 20)

                HStack {
                    if isLoginMode {
                        Button(action: {}) {
                            Text("Forgot Password?")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                        .padding(.top, 10)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        if isLoginMode {
                            viewModel.signIn(email: email, password: password)
                        } else {
                            guard password == confirmPassword else {
                                // Handle error if passwords do not match
                                return
                            }
                            viewModel.signUp(email: email, password: password, displayName: fullName)
                        }
                    }) {
                        Text(isLoginMode ? "Login" : "Sign Up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)

                Spacer()

                HStack {
                    Text(isLoginMode ? "Don’t have an account?" : "Already have an account?")
                        .foregroundColor(.white)
                    Button(action: {
                        withAnimation {
                            isLoginMode.toggle()
                        }
                    }) {
                        Text(isLoginMode ? "Sign Up" : "Login")
                            .font(.headline)
                            .foregroundColor(.green)
                    }
                }
                .padding(.bottom, 30)
            }
            .padding()
        }
    }
}

#Preview {
    AuthView()
        .environmentObject(ProfileViewModel())
}
