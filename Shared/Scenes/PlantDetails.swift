//
//  PlantDetails.swift
//  plantatinhas
//
//  Created by Rodrigo Silva Ribeiro on 18/05/21.
//

import SwiftUI

struct PlantDetails: View {
    @State var progressValue: Float = 0.6
    @State var typeOfActivity: [Activity] = [Activity.water, Activity.compost, Activity.harvest, Activity.health]
    @State var isBadgeActive: [Bool] = [false, false, false, false]
    @State var timeleft: Int = 4
    @State private var showConnectionAlert = false
    @State var diseaseIndicator = Activity.disease
    var body: some View {
        ZStack {
            VStack {
                DetailsHeader(image: self.$diseaseIndicator)
                HStack {
                    Text("Atividades: ").font(.title2).padding(10)
                    Spacer()
                }
                HStack {
                    Button(action: {
                            self.showConnectionAlert = true
                            toggleBadge(identifier: 0)
                    }) {
                        ProgressBar(progress: self.$progressValue,
                                    activity: self.$typeOfActivity[0],
                                    badge: self.$isBadgeActive[0],
                                    timeLeft: self.$timeleft)
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
                            toggleBadge(identifier: 1)
                    }) {
                        ProgressBar(progress: self.$progressValue,
                                    activity: self.$typeOfActivity[1],
                                    badge: self.$isBadgeActive[1],
                                    timeLeft: self.$timeleft)
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
                                    timeLeft: self.$timeleft)
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
                                    timeLeft: self.$timeleft)
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
                Spacer().frame(width: 100, height: 180)
            }
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
