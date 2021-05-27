//
//  NewPlantForm.swift
//  plantatinhas (iOS)
//
//  Created by Rodrigo Silva Ribeiro on 21/05/21.
//

import SwiftUI

class PlantViewModel: ObservableObject {
    // Plant Details
    @Published var name = ""
    @Published var image = Image("")
    // Water
    @Published var waterDone = false
    @Published var waterExist = false
    @Published var waterNotification = false
    @Published var waterDays: [Date] = []
    // Compost
    @Published var compostDone = false
    @Published var compostExist = false
    @Published var compostNotification = false
    @Published var compostDay: Date = Date()
    @Published var compostInterval = 0
    @Published var compostIsMonthly = false
    // Harvest
    @Published var harvestDone = false
    @Published var harvestExist = false
    @Published var harvestNotification = false
    @Published var harvestDay: Date = Date()
    @Published var harvestInterval = 0
    @Published var harvestIsMonthly = false
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
        VStack {
            HStack {
                Text("Nome ").font(.title3).padding(20)
                Spacer()
            }
            TextField("Nome", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 335, height: 40, alignment: .center)
            ImagePickerView(imageToShare: $viewModel.image)
            Spacer()
        }.foregroundColor(.black)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: SecondPage(showModal: $showModal)) {
                    Text("Próximo")
                }.environmentObject(viewModel)
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Fechar") {
                    self.showModal.toggle()
                }
            }
        }
        .navigationBarTitle("Title View2", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
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
            Text("Voltar").font(.callout)
        }
    }
    }
    var body: some View {
        HStack {
            VStack {
                ModalActivity(progressValue: 1,
                              typeOfActivity: .water,
                              isBadgeActive: false,
                              timeleft: 0,
                              diseaseIndicator: .compost,
                              notificationBool: $viewModel.waterExist,
                              label: "Rega")
                DayPicker()
                Spacer()
            }.foregroundColor(.black)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ThirdPage(showModal: $showModal)) {
                        Text("Próximo")
                    }.environmentObject(viewModel)
                }
            }
        }
        .navigationBarTitle("Title View2", displayMode: .inline)
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
            Text("Voltar").font(.callout)
        }
    }
    }
    var body: some View {
        HStack {
            VStack {
                ModalActivity(progressValue: 1,
                              typeOfActivity: .compost,
                              isBadgeActive: false,
                              timeleft: 0,
                              diseaseIndicator: .compost,
                              notificationBool: $viewModel.compostExist,
                              label: "Adubação")
                SegmentedControl()
                CustomDatePicker()
                Spacer()
            }.foregroundColor(.black)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: FourthPage(showModal: $showModal)) {
                        Text("Próximo")
                    }.environmentObject(viewModel)
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
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isOn = false
    @Binding var showModal: Bool

    var backButton : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image(systemName: "chevron.backward")
                .aspectRatio(contentMode: .fit)
            Text("Voltar").font(.callout)
        }
    }
    }
    var body: some View {
        HStack {
            VStack {
                ModalActivity(progressValue: 1,
                              typeOfActivity: .harvest,
                              isBadgeActive: false,
                              timeleft: 0,
                              diseaseIndicator: .compost,
                              notificationBool: $viewModel.harvestExist,
                              label: "Colheita")
                SegmentedControl()
                CustomDatePicker()
                Spacer()
            }.foregroundColor(.black)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Salvar") {
                        saveInCoreData()
                        self.showModal.toggle()
                    }.environmentObject(viewModel)
                }
            }
        }
        .navigationBarTitle("Nova Planta", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
    func saveInCoreData() {
        let plantWorker = PlantWorker()
        let plant = plantWorker.create(plant: PlantModel(name: viewModel.name,
                                                         disease: false,
                                                         profilePhoto: viewModel.name))
        var waterWorker = WaterWorker(plant)
        var harvestWorker = HarvestWorker(plant)
        var fertilizeWorker = FertilizeWorker(plant)

        waterWorker.create(water: WaterModel(exist: viewModel.waterExist,
                                             notification: viewModel.waterNotification,
                                             done: viewModel.waterDone,
                                             date: Date()))
        harvestWorker.create(harvest: HarvestModel(exist: viewModel.harvestExist,
                                                   notification: viewModel.harvestNotification,
                                                   done: viewModel.harvestDone,
                                                   date: viewModel.harvestDay,
                                                   interval: viewModel.harvestInterval,
                                                   isMonthly: viewModel.harvestIsMonthly))
        fertilizeWorker.create(fertilize: FertilizeModel(exist: viewModel.compostExist,
                                                         notification: viewModel.compostNotification,
                                                         done: viewModel.compostDone,
                                                         date: viewModel.compostDay,
                                                         interval: viewModel.compostInterval,
                                                         isMonthly: viewModel.compostIsMonthly))
    }
}
