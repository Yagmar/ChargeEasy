//
//  User.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 15/08/2024.
//


import Foundation
import FirebaseAuth

struct User: Identifiable {
    var id: String // Correspond à l'UID Firebase
    var email: String?
    var displayName: String?
    var photoURL: URL?
    var phoneNumber: String?
    var emailVerified: Bool
    var isAnonymous: Bool

    init(id: String, email: String? = nil, displayName: String? = nil, photoURL: URL? = nil, phoneNumber: String? = nil, emailVerified: Bool = false, isAnonymous: Bool = false) {
        self.id = id
        self.email = email
        self.displayName = displayName
        self.photoURL = photoURL
        self.phoneNumber = phoneNumber
        self.emailVerified = emailVerified
        self.isAnonymous = isAnonymous
    }
    
    // Initialiser à partir d'un FirebaseAuth.User
    init(from firebaseUser: FirebaseAuth.User) {
        self.id = firebaseUser.uid
        self.email = firebaseUser.email
        self.displayName = firebaseUser.displayName
        self.photoURL = firebaseUser.photoURL
        self.phoneNumber = firebaseUser.phoneNumber
        self.emailVerified = firebaseUser.isEmailVerified
        self.isAnonymous = firebaseUser.isAnonymous
    }
}
