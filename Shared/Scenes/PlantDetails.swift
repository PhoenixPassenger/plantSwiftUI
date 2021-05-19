//
//  PlantDetails.swift
//  plantatinhas
//
//  Created by Rodrigo Silva Ribeiro on 18/05/21.
//

import SwiftUI

struct PlantDetails: View {
    @State var progressValue: Float = 0.48
    @State var typeOfActivity1 = Activity.water
    @State var typeOfActivity2 = Activity.compost
    @State var typeOfActivity3 = Activity.harvest
    @State var typeOfActivity4 = Activity.health
    @State var isBadgeActive: Bool = true
    @State var timeleft: Int = 4
    @State private var showConnectionAlert = false
    @State var diseaseIndicator = Activity.disease
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                        .frame(width: 100, height: 100)
                    VStack {
                        Image(systemName: "person.fill")
                            .frame(width: 100, height: 100)
                            .background(Color.fontGreen)
                            .cornerRadius(50)
                        Text("Nome")
                            .font(.title2)
                            .padding(5)
                    }
                    Image("\(self.diseaseIndicator)")
                        .frame(width: 100, height: 100)
                        .offset(x: 0, y: 25)
                }
                HStack {
                    Text("Atividades: ").font(.title2).padding(10)
                    Spacer()
                }
                HStack {
                    Button(action: {
                            self.showConnectionAlert = true
                            addItem()
                    }) {
                        ProgressBar(progress: self.$progressValue,
                                    activity: self.$typeOfActivity1,
                                    badge: self.$isBadgeActive,
                                    timeLeft: self.$timeleft)
                            .frame(width: 100.0, height: 100.0)
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
                            addItem()
                    }) {
                        ProgressBar(progress: self.$progressValue,
                                    activity: self.$typeOfActivity2,
                                    badge: self.$isBadgeActive,
                                    timeLeft: self.$timeleft)
                            .frame(width: 100.0, height: 100.0)
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
                            addItem()
                    }) {
                        ProgressBar(progress: self.$progressValue,
                                    activity: self.$typeOfActivity3,
                                    badge: self.$isBadgeActive,
                                    timeLeft: self.$timeleft)
                            .frame(width: 100.0, height: 100.0)
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
                                    activity: self.$typeOfActivity4,
                                    badge: self.$isBadgeActive,
                                    timeLeft: self.$timeleft)
                            .frame(width: 100.0, height: 100.0)
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
                Spacer().frame(width: 100, height: 180)
            }
        }
    }
    private func addItem() {
        withAnimation {
            self.isBadgeActive = !self.isBadgeActive
        }
    }
    private func toggleDisease() {
        withAnimation {
            self.typeOfActivity4 = self.typeOfActivity4 == .disease ? .health : .disease
            self.diseaseIndicator = self.typeOfActivity4 == .disease ? .health : .disease
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
