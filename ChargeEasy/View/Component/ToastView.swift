//
//  ToastView.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 15/08/2024.
//

import SwiftUI

struct ToastView: View {
    var message: String
    var isError: Bool = false // Indicateur pour définir si c'est une erreur

    var body: some View {
        HStack {
            Image(systemName: isError ? "exclamationmark.triangle.fill" : "checkmark.circle.fill")
                .foregroundColor(.white)
                .imageScale(.large)
                .padding(.trailing, 10)
            
            Text(message)
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.white)
                .lineLimit(2)
                .multilineTextAlignment(.leading)

            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(isError ? Color.red : Color.green)
        )
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal, 20)
    }
}

#Preview {
    ToastView(message: "Inscription reussie")
}
