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
    @Binding var change: Bool
    @State private var distanceText: String = ""
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $locationManager.region, showsUserLocation: true, annotationItems: viewModel.chargingStations) { station in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: station.latitude, longitude: station.longitude)) {
                    Button(action: {
                        selectedStation = station
                        displayPopup = true
                        
                        print("Selected Station Latitude: \(station.latitude), Longitude: \(station.longitude)")

                                             // Print current user location's latitude and longitude
                        if let userLocation = locationManager.currentLocation {
                                                 print("User Location Latitude: \(userLocation.latitude), Longitude: \(userLocation.longitude)")
                                                 
                                                 // Calculate distance between the user's location and the station
                                                 let stationLocation = CLLocation(latitude: station.latitude, longitude: station.longitude)
                                                 let userCLLocation = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
                                                 let distance = stationLocation.distance(from: userCLLocation) // distance in meters
                                                 
                                                 // Format distance as a string
                                                 if distance >= 1000 {
                                                     distanceText = String(format: "%.1f km", distance / 1000)
                                                 } else {
                                                     distanceText = String(format: "%.0f m", distance)
                                                 }
                                                 
                                                 // Print the distance
                                                 print("Distance to station: \(distanceText)")
                                             } else {
                                                 print("User location is not available.")
                                                 distanceText = "N/A"
                                             }
                        
                        
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
            
            
            // Add user location annotation
          
                 
            
            if displayPopup, let station = selectedStation {
                VStack {
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(station.name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(station.description)
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
                                        }
                                        .padding()
                                        .background(Color.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.gray, lineWidth: 2)
                                        )
                                        
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
                                        Text("\(distanceText)")
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
                            
                            Image("borne-de-recharge")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 160)
                                .offset(x: -18, y: -60)
                        }
                    }
                    .padding()
                    .cornerRadius(20)
                    .shadow(radius: 10)
                }
                .edgesIgnoringSafeArea(.all)
            }
            
            HStack {
                Image(systemName: "map")
                Text("Liste")
            }
            .padding()
            .background(Color.green.opacity(0.8))
            .clipShape(
                RoundedRectangle(cornerRadius: 6)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.black.opacity(0.1), lineWidth: 2)
            )
            .shadow(radius: 5)
            .padding()
            .onTapGesture {
                change.toggle()
            }
        }.onAppear {
            print("locationManager.currentLocation", locationManager.currentLocation)
        }
    }
}



#Preview {
    ChargingStationMapView(change: .constant(true))
}
