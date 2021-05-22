//
//  NewPlantForm.swift
//  plantatinhas (iOS)
//
//  Created by Rodrigo Silva Ribeiro on 21/05/21.
//

import SwiftUI

class PlantViewModel: ObservableObject {
    @Published var name = ""
    @Published var image = ""
}

struct NewPlantForm: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = PlantViewModel()
        var body: some View {
            NavigationView {
                FirstPage()
            }.environmentObject(viewModel)
        }
}

struct FirstPage: View {
    @EnvironmentObject private var viewModel: PlantViewModel
    var body: some View {
        VStack {
            HStack {
                Text("Nome ")
                    .padding(10)
                Spacer()
            }
            TextField("", text: $viewModel.name)
                .padding(5)
                .background(Color.red)
                NavigationLink("dvfddsffdfd", destination: SecondPage())
        }
        
    }
}
struct SecondPage: View {
    @EnvironmentObject private var viewModel: PlantViewModel
    var body: some View {
        VStack {
            HStack {
                Text("image ")
                    .padding(10)
                Spacer()
            }
            TextField("", text: $viewModel.image)
                .padding(5)
                .background(Color.red)
        }
    }
}
