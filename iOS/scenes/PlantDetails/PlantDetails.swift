//
//  PlantDetails.swift
//  plantatinhas
//
//  Created by Rodrigo Silva Ribeiro on 18/05/21.
//

import SwiftUI
struct PlantDetails: View {
//    @State var plant: PlantModel
    @State var diseaseIndicator = Activity.disease
    var body: some View {
        ZStack {
            Color.topBackground
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {
                        
                    }) {
                       
                        Image(systemName: "square.and.pencil")
                            .imageScale(.large).font(.system(size: 24))
                            .accentColor(.health)
                            .padding(.trailing, 20)
//                            .padding(.top)
//                            .sheet(isPresented: $showModal, content: {
//                                NewPlantForm(showModal: $showModal)
//                            })
                            .frame(maxWidth: .greatestFiniteMagnitude, alignment: .trailing)
                    }
                }
                VStack(alignment: .trailing) {
                    DetailsHeader(image: self.$diseaseIndicator)
                }.padding(.trailing, -25)
                   
                    ZStack {
                        ViewBase()
                            .ignoresSafeArea()
                        Details(diseaseIndicator: self.$diseaseIndicator)

                    }
            }
        }
    }
}
struct Details: View {
//    @Binding var plant: PlantModel
    @Binding var diseaseIndicator: Activity
    @State var progressValue: Float = 0.6
    @State var typeOfActivity: [Activity] = [Activity.water, Activity.compost, Activity.harvest, Activity.health]
    @State var isBadgeActive: [Bool] = [false, false, false, false]
    @State var timeleft: Int = 4
    @State private var showConnectionAlert = false

    var body: some View {
        VStack {
            VStack {
                Text("Lembretes ")
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding(22)
                    .frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading)
                HStack {
                    Button(action: {
                            self.showConnectionAlert = true
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
                    .alert(isPresented: $showConnectionAlert) {
                        Alert(title: Text("Nice"),
                              message: Text("The alert is showing!"),
                              dismissButton: Alert.Button.default(Text("OK"),
                            action: {
                                self.showConnectionAlert = false
                            }))
                    }
                    Button(action: {
                            self.showConnectionAlert = true
                            toggleBadge(identifier: 1)
                    }) {
                        ProgressBar(progress: self.$progressValue,
                                    activity: self.$typeOfActivity[1],
                                    badge: self.$isBadgeActive[1],
                                    timeLeft: self.$timeleft,
                                    labelEnabled: true)
                            .frame(width: 120.0, height: 120.0)
                            .padding(EdgeInsets(top: 20, leading: 20, bottom: 5, trailing: 20))
                            .foregroundColor(.black)
                    }
                    .alert(isPresented: $showConnectionAlert) {
                        Alert(title: Text("Nice"),
                              message: Text("The alert is showing!"),
                              dismissButton: Alert.Button.default(Text("OK"),
                            action: {
                                self.showConnectionAlert = false
                            }))
                    }
                }
                HStack {
                    Button(action: {
                            self.showConnectionAlert = true
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
                    .alert(isPresented: $showConnectionAlert) {
                        Alert(title: Text("Nice"),
                              message: Text("The alert is showing!"),
                              dismissButton: Alert.Button.default(Text("OK"),
                            action: {
                                self.showConnectionAlert = false
                            }))
                    }
                    Button(action: {
                            self.showConnectionAlert = true
                            toggleDisease()
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
                    .alert(isPresented: $showConnectionAlert) {
                        Alert(title: Text("Nice"),
                              message: Text("The alert is showing!"),
                              dismissButton: Alert.Button.default(Text("OK"),
                            action: {
                                self.showConnectionAlert = false
                            }))
                    }
                }
                Spacer()
            }
            Spacer()
        }
    }
    private func toggleBadge(identifier: Int) {
        withAnimation {
            self.isBadgeActive[identifier] = !self.isBadgeActive[identifier]
        }
    }
    private func toggleDisease() {
        withAnimation {
            self.typeOfActivity[3] = self.typeOfActivity[3] == .disease ? .health : .disease
            self.diseaseIndicator = self.typeOfActivity[3] == .disease ? .health : .disease
        }
    }
}

struct PlantDetails_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            PlantDetails().preferredColorScheme($0)
        }
    }
}
