//
//  PlantDetails.swift
//  plantatinhas
//
//  Created by Rodrigo Silva Ribeiro on 18/05/21.
//

import SwiftUI

struct PlantDetails: View {
    @State var progressValue: Float = 0.0
    @State var typeOfActivity: String = "waters"
    @State var isBadgeActive: Bool = true
    @State var timeleft: Int = 4
    var body: some View {
        VStack {
            HStack {
                Text("Atividades:").font(.title2).padding(10)
                Spacer()
            }
            HStack {
                ProgressBar(progress: self.$progressValue,
                            activity: self.$typeOfActivity,
                            badge: self.$isBadgeActive,
                            timeLeft: self.$timeleft)
                 .frame(width: 100.0, height: 100.0)
                 .padding(25.0)
                ProgressBar(progress: self.$progressValue,
                            activity: self.$typeOfActivity,
                            badge: self.$isBadgeActive,
                            timeLeft: self.$timeleft)
                 .frame(width: 100.0, height: 100.0)
                 .padding(25.0)
            }
            HStack {
                ProgressBar(progress: self.$progressValue,
                            activity: self.$typeOfActivity,
                            badge: self.$isBadgeActive,
                            timeLeft: self.$timeleft)
                 .frame(width: 100.0, height: 100.0)
                 .padding(25.0)
                ProgressBar(progress: self.$progressValue,
                            activity: self.$typeOfActivity,
                            badge: self.$isBadgeActive,
                            timeLeft: self.$timeleft)
                 .frame(width: 100.0, height: 100.0)
                 .padding(25.0)
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
