//
//  Menu.swift
//  plantatinhas (iOS)
//
//  Created by Paulo Uchôa on 20/05/21.
//

import SwiftUI

struct Menu: View {

    @State var progressValue: Float = 100
    @State var typeOfActivity1 = Activity.water
    @State var typeOfActivity2 = Activity.compost
    @State var typeOfActivity3 = Activity.harvest
    @State var isBadgeActive: Bool = false
    @State var timeleft: Int = 0

    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center, spacing: 10) {
                NavigationLink(destination: ListActivities(activity: $typeOfActivity1)) {
                    VStack {
                        ProgressBar(progress: self.$progressValue,
                                    activity: self.$typeOfActivity1,
                                    badge: self.$isBadgeActive,
                                    timeLeft: self.$timeleft,
                                    lineWidth: 5)
                            .frame(minWidth: 48, idealWidth: 52, maxWidth: 58, minHeight: 48, idealHeight: 52, maxHeight: 58)
                            .foregroundColor(.black)
                        Text("Regar")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                    }
                }.buttonStyle(BorderedButtonStyle(tint: .blue.opacity(0)))
                .frame(minWidth: 78, idealWidth: 78, maxWidth: 78, minHeight: 78, idealHeight: 72, maxHeight: 72)
                NavigationLink(destination: ListActivities(activity: $typeOfActivity2)) {
                    VStack {
                        ProgressBar(progress: self.$progressValue,
                                    activity: self.$typeOfActivity2,
                                    badge: self.$isBadgeActive,
                                    timeLeft: self.$timeleft,
                                    lineWidth: 5)
                            .frame(minWidth: 48, idealWidth: 52, maxWidth: 58, minHeight: 48, idealHeight: 52, maxHeight: 58)
                            .foregroundColor(.black)
                        Text("Adubar")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                    }
                }.buttonStyle(BorderedButtonStyle(tint: .blue.opacity(0)))
                .frame(minWidth: 78, idealWidth: 78, maxWidth: 78, minHeight: 78, idealHeight: 72, maxHeight: 72)
            }.padding(.top, 20)

            HStack(alignment: .center) {
                NavigationLink(destination: ListActivities(activity: $typeOfActivity3)) {
                    VStack {
                        ProgressBar(progress: self.$progressValue,
                                    activity: self.$typeOfActivity3,
                                    badge: self.$isBadgeActive,
                                    timeLeft: self.$timeleft,
                                    lineWidth: 5)
                            .frame(minWidth: 48, idealWidth: 52, maxWidth: 58, minHeight: 48, idealHeight: 52, maxHeight: 58)
                            .foregroundColor(.black)
                        Text("Colher")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                    }
                }.buttonStyle(BorderedButtonStyle(tint: .blue.opacity(0)))
                .frame(minWidth: 78, idealWidth: 78, maxWidth: 78, minHeight: 78, idealHeight: 72, maxHeight: 72)
            }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
