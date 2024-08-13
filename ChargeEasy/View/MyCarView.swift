//
//  MyCarView.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 11/08/2024.
//

import SwiftUI



struct MyCarView: View {
    @StateObject private var viewModel = MyCarViewModel()

    var body: some View {
        ScrollView {
//            Color.black.edgesIgnoringSafeArea(.all) // Background color
            
            VStack(spacing: 20) {
                // Car image and name
                HStack {
                    Image(viewModel.myCar.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                       
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(viewModel.myCar.modelName)
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(.gray)
                            Text("150 km - Parked")
                                .foregroundColor(.gray)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)

                // Battery view
                HStack (alignment: .top){
                    
                    BatteryView(batteryLevel: viewModel.myCar.currentBatteryLevel, range: viewModel.myCar.range)
                    
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Climate")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text("Interior 27°")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            HStack {
                                Text("20°")
                                    .font(.title)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Image(systemName: "fanblades.fill")
                                    .foregroundColor(.blue)
                            }
                            .padding(.top, 5)
                        }
                        .padding()
                        .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                        
                        VStack(alignment: .leading) {
                            HStack{
                                Text("Safety")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Image(systemName: "arrow.right.to.line")
                                    .foregroundColor(.white)
                            }
                          
                        }
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(10)
                    }
                    
                    
                  
                }
                
                
                HStack(alignment:.top) {
                    VStack(alignment: .leading) {
                        Text("Connector type")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text(viewModel.myCar.connectorType.description)
                            .foregroundColor(.white)
                    }
                  
                   
                    Image(viewModel.myCar.connectorType.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .background(.white)
                        .cornerRadius(10)
                }
                .padding()
                .background(Color.black.opacity(0.7))
                .cornerRadius(10)
                
                
                // Additional controls (e.g., climate, safety)
             
                
          
                Spacer()

                // Bottom navigation or controls can be added here
            }
            .padding()
        }
    }
}


#Preview {
    MyCarView()
}
