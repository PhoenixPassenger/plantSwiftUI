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
    @State var typeOfActivity4 = Activity.disease
    @State var isBadgeActive: Bool = true
    @State var timeleft: Int = 4
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    VStack {
                        Image(systemName: "person.fill")
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            .background(Color.fontGreen)
                            .cornerRadius(50)
                        Text("Nome")
                            .font(.title2)
                            .padding(5)
                    }
                    Image("health")
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .offset(x: 0, y: 25)
                }
                HStack {
                    Text("Atividades: ").font(.title2).padding(10)
                    Spacer()
                }
                HStack {
                    ProgressBar(progress: self.$progressValue,
                                activity: self.$typeOfActivity1,
                                badge: self.$isBadgeActive,
                                timeLeft: self.$timeleft)
                     .frame(width: 100.0, height: 100.0)
                     .padding(EdgeInsets(top: 20, leading: 20, bottom: 5, trailing: 20))
                    ProgressBar(progress: self.$progressValue,
                                activity: self.$typeOfActivity2,
                                badge: self.$isBadgeActive,
                                timeLeft: self.$timeleft)
                     .frame(width: 100.0, height: 100.0)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 5, trailing: 20))
                }
                HStack {
                    ProgressBar(progress: self.$progressValue,
                                activity: self.$typeOfActivity3,
                                badge: self.$isBadgeActive,
                                timeLeft: self.$timeleft)
                     .frame(width: 100.0, height: 100.0)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 5, trailing: 20))
                    ProgressBar(progress: self.$progressValue,
                                activity: self.$typeOfActivity4,
                                badge: self.$isBadgeActive,
                                timeLeft: self.$timeleft)
                     .frame(width: 100.0, height: 100.0)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 5, trailing: 20))
                }
                
                Spacer().frame(width: 100, height: 180)
            }
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
