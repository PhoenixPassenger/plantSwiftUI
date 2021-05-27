//
//  ImagePicker.swift
//  plantatinhas (iOS)
//
//  Created by Rodrigo Silva Ribeiro on 24/05/21.
//

import SwiftUI

struct ImagePickerView: View {
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image = Image(systemName: "camera")
    @Binding var imageToShare: Data?
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        imageToShare = inputImage.pngData()
    }
    var body: some View {
        VStack {
            HStack {
                Text("Foto de perfil ").font(.title3).padding(20)
                Spacer()
            }
            Button(action: {
                self.showingImagePicker = true
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12,
                                     style: .continuous)
                        .frame(width: 335, height: 180, alignment: .center)
                        .foregroundColor(.fontGreen)
                    if inputImage != nil {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 335, height: 180, alignment: .center)
                    } else {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(.health)
                    }
                }
            }.sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<ImagePicker>) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
