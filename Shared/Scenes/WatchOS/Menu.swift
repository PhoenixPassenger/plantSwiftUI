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
    @State var typeOfActivity4 = Activity.health
    @State var isBadgeActive: Bool = false
    @State var timeleft: Int = 4

    
    var body: some View {
        VStack{
            HStack(alignment: .center, spacing: 20){
                NavigationLink(destination: self) {
                    ProgressBar(progress: self.$progressValue,
                                activity: self.$typeOfActivity1,
                                badge: self.$isBadgeActive,
                                timeLeft: self.$timeleft)
                        .frame(width: 48.0, height: 48.0)
                        .foregroundColor(.black)
                        
                }.buttonStyle(BorderedButtonStyle(tint: .blue.opacity(0)))
                NavigationLink(destination: self) {
                    ProgressBar(progress: self.$progressValue,
                                activity: self.$typeOfActivity1,
                                badge: self.$isBadgeActive,
                                timeLeft: self.$timeleft)
                        .frame(width: 48.0, height: 48.0)
                        .foregroundColor(.black)
                }.buttonStyle(BorderedButtonStyle(tint: .blue.opacity(0)))
            }
            NavigationLink(destination: self) {
                ProgressBar(progress: self.$progressValue,
                            activity: self.$typeOfActivity1,
                            badge: self.$isBadgeActive,
                            timeLeft: self.$timeleft)
                    .frame(width: 48.0, height: 48.0)
                    .foregroundColor(.black)
            }.buttonStyle(BorderedButtonStyle(tint: .blue.opacity(0)))
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
