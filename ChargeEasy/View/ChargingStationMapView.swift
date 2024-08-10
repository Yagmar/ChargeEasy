//
//  ChargingStationMapView.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 10/08/2024.
//

import SwiftUI
import MapKit



import SwiftUI
import MapKit

struct ChargingStationMapView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var viewModel = ChargingStationViewModel()
    @State private var displayPopup: Bool = false
    @State private var selectedStation: ChargingStation? = nil
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack(alignment: .topLeading){
            Map(coordinateRegion: $locationManager.region, annotationItems: viewModel.chargingStations) {  station in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: station.latitude, longitude: station.longitude)) {
                    Button(action: {
                        print("Station clicked: \(station.name)")
                        selectedStation = station
                        displayPopup = true
                    }, label: {
                        VStack {
                            Image(systemName: station.chargingType == .DC ? "bolt.circle.fill" : "bolt.fill")
                                .foregroundColor(station.isAvailable ? .green : .red)
                                .padding(5)
                                .background(Circle().fill(station.chargingType == .DC ? Color.blue : Color.orange))
                        }
                    })
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                           presentationMode.wrappedValue.dismiss() // Dismiss the current view
                       }) {
                           HStack {
                               Image(systemName: "chevron.left")
                                   .foregroundColor(.black)
                            
                           }
                           .padding()
                           .background(Color.white)
                           .clipShape(
                               RoundedRectangle(cornerRadius: 20)
                           )
                           .overlay(
                               RoundedRectangle(cornerRadius: 20)
                                .stroke(.black.opacity(0.2), lineWidth: 2)
                           )
                           .padding([.top, .leading], 16)
                       }

            
            if displayPopup, let station = selectedStation {
                VStack {
                      Spacer()
                      
                      VStack(alignment: .leading, spacing: 0) {
                
                              HStack {
                                  VStack(alignment: .leading) {
                                      Text(station.name)
                                          .font(.headline)
                                          .foregroundColor(.white)
                                      Text(station.description) // Example address, you can adjust
                                          .font(.subheadline)
                                          .foregroundColor(.white)
                                  }
                                  Spacer()
                                  Image(systemName: "xmark.circle.fill")
                                      .foregroundColor(.white)
                                      .onTapGesture {
                                          displayPopup.toggle()
                                      }
                              }
                              .padding()

                         
                          .background(Color.black.opacity(0.8))
                        
                          Divider().background(Color.white)
                          
                          ZStack(alignment: .topTrailing) {
                              VStack(alignment: .leading, spacing: 0) {
                                  VStack(alignment: .leading) {
                                      Text("Connection type & power")
                                          .font(.title2)
                                          .bold()
                                          .foregroundColor(.black)
                                  
                                      
                                      HStack {
                                          HStack {
                                              Image("borne-de-recharge")
                                                  .resizable()
                                                  .aspectRatio(contentMode: .fit)
                                                  .frame(width: 20, height: 20)
                                                  .foregroundColor(.green)
                                              Text("\(station.connectorType.rawValue)")
                                                  .font(.body)
                                          }
                                          .padding()
                                          .background(Color.white)
                                          .clipShape(RoundedRectangle(cornerRadius: 20))
                                          .overlay(
                                              RoundedRectangle(cornerRadius: 20)
                                                  .stroke(Color.gray, lineWidth: 2)
                                          )
//                                          Spacer()
                                          
                                          HStack {
                                              Image(systemName: "bolt.fill")
                                                  .foregroundColor(.green)
                                              Text("\(station.power, specifier: "%.1f") kW")
                                                  .font(.body)
                                          }
                                          .padding()
                                          .background(Color.white)
                                          .clipShape(RoundedRectangle(cornerRadius: 20))
                                          .overlay(
                                              RoundedRectangle(cornerRadius: 20)
                                                  .stroke(Color.gray, lineWidth: 2)
                                          )
                                      }
                                  }
                                  .padding()
                                  
                                  HStack {
                                      VStack(alignment: .leading) {
                                          Text("Connector")
                                              .font(.subheadline)
                                              .foregroundColor(.gray)
                                          Text("07")
                                              .font(.body)
                             
                                      }
                                      Spacer()
                                      VStack(alignment: .leading) {
                                          Text("Distance")
                                              .font(.subheadline)
                                              .foregroundColor(.gray)
                                          Text("4.5 km")
                                              .font(.body)
                                     
                                      }
                                      Spacer()
                                      VStack(alignment: .leading) {
                                          Text("Availability")
                                              .font(.subheadline)
                                              .foregroundColor(.gray)
                                          Text(station.isAvailable ? "Open 24 hrs" : "Closed")
                                              .font(.body)
                                              .foregroundStyle(station.isAvailable ? Color.green : Color.red)
                                
                                      }
                                  }
                                  .padding()
                                  
                                  Divider().background(Color.white)
                                  
                                  let (minPrice, maxPrice) = station.calculatePrice()
                                  
                                  HStack {
                                      VStack {
                                          Text("Estimated Price:")
                                          .font(.title3)
                                          .bold()
                                              
                                          Text("\(minPrice, specifier: "%.2f") € - \(maxPrice, specifier: "%.2f") €")
                                      }
                                  
                                      Spacer()
                                      
                                      Button(action: {
                                          // Action to book the station
                                      }) {
                                          Text("Book Now")
                                              .font(.headline)
                                              .foregroundColor(.white)
                                              .padding()
                                              .background(Color.black.opacity(0.8))
                                              .cornerRadius(10)
                                      }
                                  }
                                  .padding()
                              }
                              .background(Color.white)
                          
                              
                              // Placing the image over the right side of the two sections
                              Image("borne-de-recharge")
                                  .resizable()
                                  .aspectRatio(contentMode: .fit)
                                  .frame(width: 80, height: 160) // Adjust the size accordingly
                                  .offset(x: -18, y: -60)
                          }
//                          .padding(.top, -40)
                      }
                      .padding()
                      .cornerRadius(20)
                      .shadow(radius: 10)
                  }
               
            
                .edgesIgnoringSafeArea(.all)
            }
         
        }
    }
}




#Preview {
    ChargingStationMapView()
}
