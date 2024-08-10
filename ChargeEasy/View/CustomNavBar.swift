//
//  CustomNavBar.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 10/08/2024.
//

import SwiftUI

struct CustomNavBar: View {
    @Binding  var selectedTab: String
    
    var body: some View {
        HStack {
            Spacer()

            Button(action: {
                selectedTab = "Home"
            }) {
                Image(systemName: "house.fill")
                
                    .font(.system(size: 20))
                    .padding(5)
                    .background(selectedTab == "Home" ? Color.green : Color.clear)
                    .foregroundColor(selectedTab == "Home" ? .white : .white)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            .padding(.horizontal, 30)

            Spacer()

            Button(action: {
                selectedTab = "MyCar"
            }) {
                HStack {
                    Image(systemName: "car.fill")
                        .font(.system(size: 25))
                    Text("My Car")
                        .font(.headline)
                        .fontWeight(.bold)
                }
                .padding(.horizontal, 5)
                .padding(.vertical, 5)
                .frame(width: 130)
                .background(selectedTab == "MyCar" ? Color.green : Color.clear)
                .foregroundColor(selectedTab == "MyCar" ? .white : .white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
              
            }

            Spacer()

            Button(action: {
                selectedTab = "Profile"
            }) {
                Image(systemName: "person.fill")
               
                    .font(.system(size: 20))
                
                    .padding(5)
                    .background(selectedTab == "Profile" ? Color.green : Color.clear)
                    .foregroundColor(selectedTab == "Profile" ? .white : .white)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            .padding(.horizontal, 30)

            Spacer()
        }
        .padding()
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 20)
        .shadow(radius: 5)
    }
}
#Preview {
    CustomNavBar(selectedTab: .constant("Home"))
}
