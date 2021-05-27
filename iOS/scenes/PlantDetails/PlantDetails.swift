//
//  PlantDetails.swift
//  plantatinhas
//
//  Created by Rodrigo Silva Ribeiro on 18/05/21.
//

import SwiftUI
struct PlantDetails: View {
     var plant: Plant
    var body: some View {
        ZStack {
            Color.topBackground
                .ignoresSafeArea()
            VStack {
                DetailsHeader(image: self.plant.profilePhoto ?? "person.fill")
                    ZStack {
                        ViewBase()
                            .ignoresSafeArea()
                        Details(diseaseIndicator: self.plant.disease)

                    }
            }
        }
    }
}

struct Details: View {
    var diseaseIndicator: Bool
    @State var progressValue: Float = 0.6
    @State var typeOfActivity: [Activity] = [Activity.water, Activity.compost, Activity.harvest, Activity.health]
    @State var isBadgeActive: [Bool] = [false, false, false, false]
    @State var timeleft: Int = 4
    @State private var showWaterAlert = false
    @State private var showHarvestAlert = false
    @State private var showFertilizeAlert = false
    @State private var showDiseaseAlert = false

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Atividades: ").font(.title2).padding(20)
                    Spacer()
                }
                HStack {
                    Button(action: {
                            self.showWaterAlert = true
                            toggleBadge(identifier: 0)
                    }) {
                        ProgressBar(progress: self.$progressValue,
                                    activity: self.$typeOfActivity[0],
                                    badge: self.$isBadgeActive[0],
                                    timeLeft: self.$timeleft,
                                    labelEnabled: true)
                            .frame(width: 120, height: 120)
                            .padding(EdgeInsets(top: 20, leading: 20, bottom: 5, trailing: 20))
                            .foregroundColor(.black)
                    }
                    .actionSheet(isPresented: $showWaterAlert) {
                                ActionSheet(
                                    title: Text("Atividade"),
                                    message: Text("Você deseja realizar essa ação?"),
                                    buttons: [
                                        .default(Text("Regar"), action: {
                                            self.progressValue = 0
                                            self.showWaterAlert = false
                                        }),
                                        .cancel()]
                                )
                            }
                  
//                    .alert(isPresented: $showConnectionAlert) {
//                        Alert(title: Text("Atividade"),
//                              message: Text("Você deseja realizar essa ação"),
//                              dismissButton: Alert.Button.default(Text("Cancelar"),
//                            action: {
//
//                                self.showConnectionAlert = false
//                            }))
//                    }
                    Button(action: {
                            self.showFertilizeAlert = true
                            toggleBadge(identifier: 1)
                    }){
                        ProgressBar(progress: self.$progressValue,
                                    activity: self.$typeOfActivity[1],
                                    badge: self.$isBadgeActive[1],
                                    timeLeft: self.$timeleft,
                                    labelEnabled: true)
                            .frame(width: 120.0, height: 120.0)
                            .padding(EdgeInsets(top: 20, leading: 20, bottom: 5, trailing: 20))
                            .foregroundColor(.black)
                    }
                    .actionSheet(isPresented: $showFertilizeAlert) {
                                ActionSheet(
                                    title: Text("Atividade"),
                                    message: Text("Você deseja realizar essa ação?"),
                                    buttons: [
                                        .default(Text("Adubar"), action: {
                                            self.showFertilizeAlert = false
                                        }),
                                        .cancel()]
                                )
                            }
                }
                HStack {
                    Button(action: {
                            self.showHarvestAlert = true
                            toggleBadge(identifier: 2)
                    }) {
                        ProgressBar(progress: self.$progressValue,
                                    activity: self.$typeOfActivity[2],
                                    badge: self.$isBadgeActive[2],
                                    timeLeft: self.$timeleft,
                                    labelEnabled: true)
                            .frame(width: 120.0, height: 120.0)
                            .padding(EdgeInsets(top: 20, leading: 20, bottom: 5, trailing: 20))
                            .foregroundColor(.black)
                    }
                    .actionSheet(isPresented: $showHarvestAlert) {
                                ActionSheet(
                                    title: Text("Atividade"),
                                    message: Text("Você deseja realizar essa ação?"),
                                    buttons: [
                                        .default(Text("Colher"), action: {
                                            self.showHarvestAlert = false
                                        }),
                                        .cancel()]
                                )
                            }
                    Button(action: {
                            self.showDiseaseAlert = true
                    }) {
                        ProgressBar(progress: self.$progressValue,
                                    activity: self.$typeOfActivity[3],
                                    badge: self.$isBadgeActive[3],
                                    timeLeft: self.$timeleft,
                                    labelEnabled: true)
                            .frame(width: 120.0, height: 120.0)
                            .padding(EdgeInsets(top: 20, leading: 20, bottom: 5, trailing: 20))
                            .foregroundColor(.black)
                    }
                    .actionSheet(isPresented: $showDiseaseAlert) {
                    ActionSheet(
                        title: Text("Atividade"),
                        message: Text("Você deseja realizar essa ação?"),
                        buttons: [
                            .default(Text("Mudar saúde da planta"), action: {
                                toggleDisease()
                                self.showDiseaseAlert = false
                            }),
                            .cancel()]
                            
                    )
                }
                }
                Spacer().frame(width: 100, height: 180)
            }
        }
    }
    private func progress(activity: Int) -> Float{
        let progress: Float
        switch activity {
        case 0:
            progress = 0.5
        case 1:
            progress = 0.2
        case 2:
            progress = 0.4
        default:
            progress = 0
        }
        return progress
        
    }
    private func toggleBadge(identifier: Int) {
        withAnimation {
            self.isBadgeActive[identifier] = !self.isBadgeActive[identifier]
        }
    }
    private func toggleDisease() {
        withAnimation {
//            self.typeOfActivity[3] = self.typeOfActivity[3] == .disease ? .health : .disease
//            self.diseaseIndicator = self.typeOfActivity[3] == .disease ? .health : .disease
        }
    }
}

//struct PlantDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        ForEach(ColorScheme.allCases, id: \.self) {
//           PlantDetails().preferredColorScheme($0)
//        }
//    }
//}
