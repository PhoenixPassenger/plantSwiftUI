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
    @Binding var showModal: Bool
    var body: some View {
        NavigationView {
            FirstPage(showModal: $showModal)
        }.environmentObject(viewModel)
    }
}

struct FirstPage: View {
    @EnvironmentObject private var viewModel: PlantViewModel
    @Binding var showModal: Bool
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("Nome")
                        .padding(10)
                    Spacer()
                }
                TextField("", text: $viewModel.name)
                    .padding(5)
            }
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: SecondPage(showModal: $showModal)) {
                    Text("Próximo")
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Close") {
                    self.showModal.toggle()
                }
            }
        }
    }
}

struct SecondPage: View {
    @EnvironmentObject private var viewModel: PlantViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isOn = false
    @Binding var showModal: Bool

    var backButton : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image(systemName: "chevron.backward")
                .aspectRatio(contentMode: .fit)
            Text("Back").font(.callout)
        }
    }
    }
    var body: some View {
        HStack {
            VStack {
                ModalActivity(progressValue: 1, typeOfActivity: .water, isBadgeActive: false, timeleft: 0, diseaseIndicator: .compost, isOn: $isOn, label: "Rega")
                DayPicker()
                Spacer()
            }.foregroundColor(.black)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ThirdPage(showModal: $showModal)) {
                        Text("Próximo")
                    }
                }
            }
        }
        .navigationBarTitle("Title View2", displayMode: .large)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

struct ThirdPage: View {
    @EnvironmentObject private var viewModel: PlantViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isOn = false
    @Binding var showModal: Bool

    var backButton : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image(systemName: "chevron.backward")
                .aspectRatio(contentMode: .fit)
            Text("Back").font(.callout)
        }
    }
    }
    var body: some View {
        HStack {
            VStack {
                ModalActivity(progressValue: 1, typeOfActivity: .compost, isBadgeActive: false, timeleft: 0, diseaseIndicator: .compost, isOn: $isOn, label: "Adubação")
                SegmentedControl()
                CustomDatePicker()
                Spacer()
            }.foregroundColor(.black)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: FourthPage(showModal: $showModal)) {
                        Text("Próximo")
                    }
                }
            }
        }
        .navigationBarTitle("Nova Planta", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

struct FourthPage: View {
    @EnvironmentObject private var viewModel: PlantViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isOn = false
    @Binding var showModal: Bool

    var backButton : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image(systemName: "chevron.backward")
                .aspectRatio(contentMode: .fit)
            Text("Back").font(.callout)
        }
    }
    }
    var body: some View {
        HStack {
            VStack {
                ModalActivity(progressValue: 1, typeOfActivity: .harvest, isBadgeActive: false, timeleft: 0, diseaseIndicator: .compost, isOn: $isOn, label: "Colheita")
                SegmentedControl()
                CustomDatePicker()
                Spacer()
            }.foregroundColor(.black)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Salvar") {
                        self.showModal.toggle()
                    }
                }
            }
        }
        .navigationBarTitle("Nova Planta", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}
