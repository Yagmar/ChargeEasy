//
//  ChargeEasyApp.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 07/08/2024.
//

import SwiftUI
import Firebase

@main
struct ChargeEasyApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
