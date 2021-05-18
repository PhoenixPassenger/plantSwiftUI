//
//  circleProgress.swift
//  plantatinhas (iOS)
//
//  Created by Rodrigo Silva Ribeiro on 18/05/21.
//

import SwiftUI

/*
 Variáveis necessárias para uso do componente :
     @State var progressValue: Float = 0.0
     @State var typeOfActivity: String = "waters"
     @State var isBadgeActive: Bool = false
     @State var timeleft: Int = 4
 
 Forma de chamar o componente :
    ProgressBar(progress: self.$progressValue, activity: self.$activity, badge: self.$badge, timeLeft: self.$timeleft)
     .frame(width: 150.0, height: 150.0)
     .padding(40.0)
 */

struct ProgressBar: View {
    @Binding var progress: Float
    @Binding var activity: String
    @Binding var badge: Bool
    @Binding var timeLeft: Int
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .foregroundColor(Color.gray4)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.water)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            Image(systemName: "pencil")
            if badge {
                Text("\(timeLeft)d").padding(10).background(Color.water).clipShape(RoundedRectangle(cornerRadius: 12)).foregroundColor(.black).offset(x: 80, y: -45).font(.title2)
            }
        }
    }
}
