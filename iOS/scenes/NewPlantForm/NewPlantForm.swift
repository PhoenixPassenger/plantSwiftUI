//
//  NewPlantForm.swift
//  plantatinhas (iOS)
//
//  Created by Rodrigo Silva Ribeiro on 21/05/21.
//

import SwiftUI
import Combine


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
    @Published var compostInterval = 1
    @Published var compostIsMonthly = false
    // Harvest
    @Published var harvestDone = false
    @Published var harvestExist = false
    @Published var harvestNotification = false
    @Published var harvestDay: Date = Date()
    @Published var harvestInterval = 1
    @Published var harvestIsMonthly = false
    
    
    let onSave = PassthroughSubject<Void, Never>()
    let onCancel = PassthroughSubject<Void, Never>()
    
    
    func saveInCoreData() {
        let plantWorker = PlantWorker()
        let plant = plantWorker.create(plant: PlantModel(name: name,
                                                         disease: false,
                                                         profilePhoto: name))
        var waterWorker = WaterWorker(plant)
        var harvestWorker = HarvestWorker(plant)
        var fertilizeWorker = FertilizeWorker(plant)

        waterWorker.create(water: WaterModel(exist: waterExist,
                                             notification: waterNotification,
                                             done: waterDone,
                                             date: Date()))
        harvestWorker.create(harvest: HarvestModel(exist: harvestExist,
                                                   notification: harvestNotification,
                                                   done: harvestDone,
                                                   date: harvestDay,
                                                   interval: harvestInterval,
                                                   isMonthly: harvestIsMonthly))
        fertilizeWorker.create(fertilize: FertilizeModel(exist: compostExist,
                                                         notification: compostNotification,
                                                         done: compostDone,
                                                         date: compostDay,
                                                         interval: compostInterval,
                                                         isMonthly: compostIsMonthly))
        
        onSave.send()
    }
    
}

struct NewPlantForm: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = PlantViewModel()
    
    @Binding var showModal: Bool
    var body: some View {
        NavigationView {
            FirstPage()
        }
        .environmentObject(viewModel)
        .onReceive(viewModel.onSave) {
            showModal = false
        }
    }
}

struct FirstPage: View {
    @EnvironmentObject private var viewModel: PlantViewModel
    
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
        .navigationBarTitle("Title View2", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: leadingButton, trailing: trailingButton)
    }
    var leadingButton: some View {
        Button("Fechar") {
            viewModel.onCancel.send()
        }
    }
    
    var trailingButton: some View {
        NavigationLink(destination: SecondPage()) {
            Text("Próximo")
        }
    }
    
}

struct SecondPage: View {
    @EnvironmentObject private var viewModel: PlantViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isOn = false
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
                    NavigationLink(destination: ThirdPage()) {
                        Text("Próximo")
                    }
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
                SegmentedControl(isMonthly: $viewModel.compostIsMonthly, timeCount: $viewModel.compostInterval)
                CustomDatePicker(date: $viewModel.compostDay)
                Spacer()
            }.foregroundColor(.black)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: FourthPage()) {
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
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isOn = false

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
                SegmentedControl(isMonthly: $viewModel.harvestIsMonthly, timeCount: $viewModel.harvestInterval)
                CustomDatePicker(date: $viewModel.compostDay)
                Spacer()
            }.foregroundColor(.black)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Salvar") {
                        viewModel.saveInCoreData()
                    }
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
