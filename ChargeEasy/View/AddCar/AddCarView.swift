//
//  AddCarView.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 19/08/2024.
//

import SwiftUI

import SwiftUI

struct AddCarView: View {
    @StateObject var viewModel = MyCarViewModel()
    
    var body: some View {
        VStack {
            if viewModel.showPreview {
                PreviewCarView(car: viewModel.newCar, onEdit: {
                    viewModel.showPreview = false
                }, onSave: {
//                    if let userID = Auth.auth().currentUser?.uid {
//                        viewModel.saveCarToFirestore(userID: userID)
//                    }
                })
            } else {
                TabView(selection: $viewModel.currentStep) {
                    Step1CarPhotoView(car: $viewModel.newCar)
                        .tag(0)
                    Step2CarDetailsView(car: $viewModel.newCar)
                        .tag(1)
                    Step3CarSummaryView(car: $viewModel.newCar)
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle())
                
                HStack {
                    if viewModel.currentStep > 0 {
                        Button("Back") {
                            withAnimation {
                                viewModel.currentStep -= 1
                            }
                        }
                    }
                    
                    Spacer()
                    
                    if viewModel.currentStep < 2 {
                        Button("Next") {
                            withAnimation {
                                viewModel.currentStep += 1
                            }
                        }
                    } else {
                        Button("Preview") {
                            withAnimation {
                                viewModel.showPreview = true
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .padding()
        .alert(isPresented: $viewModel.showSuccessMessage) {
            Alert(title: Text("Success"), message: Text("Car added successfully!"), dismissButton: .default(Text("OK")))
        }
    }
    
  
}


#Preview {
    AddCarView()
}
