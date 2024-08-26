//
//  Step1CarPhotoView.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 19/08/2024.
//

import SwiftUI



struct Step1CarPhotoView: View {
    @Binding var car: ElectricCar
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
     @State var image: UIImage?
    @State private var selectedImage: UIImage? = nil
    
    var body: some View {
        VStack {
            Text("Step 1: Add a Photo of Your Car")
                .font(.title)
                .padding()
            
            // Placez ici votre propre mécanisme pour ajouter une photo (Image Picker)
            if let image = selectedImage {
                 Image(uiImage: image)
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .clipShape(Circle())
                     .frame(width: 200, height: 200)
              
                     .shadow(radius: 10)
                     .padding()
             } else {
                 Image("placeholder-car")
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 200, height: 200)
                     .clipShape(Circle())
                     .shadow(radius: 10)
                     .padding()
             }
            
            // Simulate photo adding
            HStack {
                Button("Take Photo") {
                    sourceType = .camera
                    showImagePicker = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("Choose from Gallery") {
                    sourceType = .photoLibrary
                    showImagePicker = true
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            

        }
        .fullScreenCover(isPresented: $showImagePicker, content: {
            ImagePicker(selectedImage: $selectedImage, sourceType: sourceType)
        
        })
                 
    }
    
    func uploadImage() {
         guard let image = selectedImage else {
             print("No image selected.")
             return
         }
         
         if let pngData = image.pngData() {
             // Maintenant vous avez les données PNG que vous pouvez envoyer à votre serveur.
             // Exemple d'utilisation avec une requête HTTP
             // uploadToServer(pngData: pngData)
             print("PNG data prête à être envoyée.", pngData)
         } else {
             print("Erreur lors de la conversion de l'image en PNG.")
         }
     }
}


#Preview {
    Step1CarPhotoView(car: .constant( ElectricCar(
        id: UUID(),
        modelName: "Tesla Model S",
        batteryCapacity: 100.0,
        currentBatteryLevel: 0.9,
        range: 500.0,
        consumption: 20.0,
        chargingStatus: "Charging",
        connectorType: .Tesla,
        image: "tesla-model-s"  // Assurez-vous d'avoir une image avec ce nom dans vos assets
    )))
}
