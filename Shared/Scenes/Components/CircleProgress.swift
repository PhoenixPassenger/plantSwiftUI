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
 ProgressBar(progress: self.$progressValue,
     activity: self.$typeOfActivity,
     badge: self.$isBadgeActive,
     timeLeft: self.$timeleft)
  .frame(width: 150.0, height: 150.0)
  .padding(40.0)
 */

enum Activity: String {
    case water
    case disease
    case compost
    case harvest
    case health
}

struct ProgressBar: View {
    @Binding var progress: Float
    @Binding var activity: Activity
    @Binding var badge: Bool
    @Binding var timeLeft: Int
    var body: some View {
        let color = Color("\(activity)")
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 10.0)
                    .foregroundColor(Color.gray4)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(
                                                    (activity != .disease && activity != .health ?
                                                        self.progress : 1.0), 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(color)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
                Image(systemName: "pencil")
                GeometryReader { (geometry) in
                    let offsetX = geometry.size.width * 0.70
                    let offsetY = geometry.size.height * -0.12

                    if badge && activity != .disease && activity != .health {
                        Text("\(timeLeft)d")
                            .padding(EdgeInsets(top: 5, leading: 12, bottom: 5, trailing: 12))
                            .background(color)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .foregroundColor(.black)
                            .offset(x: offsetX, y: offsetY)
                            .font(.title3)
                    }
                }
            }
            HStack {
                Spacer()
                let title = activity.rawValue
                Text("\(title)")
                    .font(.title3)
                Spacer()
            }.padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
        }
    }
}
struct CircleProgressPreviews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            PlantDetails().preferredColorScheme($0)
        }
    }
}
