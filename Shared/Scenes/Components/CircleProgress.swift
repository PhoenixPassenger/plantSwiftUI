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
    var imageName: String {
        switch self {
        case .water:
            return "Water"
        case .disease:
            return "disease"
        case .compost:
            return "Compost"
        case .harvest:
            return "Harvest"
        case .health:
            return "health"
        }
    }
    var coloredImageName: String {
        switch self {
        case .water:
            return "WaterColored"
        case .disease:
            return "disease"
        case .compost:
            return "CompostColored"
        case .harvest:
            return "HarvestColored"
        case .health:
            return "health"
        }
    }
    var title: String {
        switch self {
        case .water:
            return "Regar"
        case .disease:
            return "Doente"
        case .compost:
            return "Adubar"
        case .harvest:
            return "Colher"
        case .health:
            return "Saudável"
        }
    }
}

struct ProgressBar: View {
    @Binding var progress: Float
    @Binding var activity: Activity
    @Binding var badge: Bool
    @Binding var timeLeft: Int
    var labelEnabled: Bool = false
    var lineWidth: Float = 8.0
    var body: some View {
        let color = Color("\(activity)")
        VStack {
            ZStack(alignment: .center) {
                Circle()
                    .stroke(lineWidth: CGFloat(lineWidth))
                    .foregroundColor(Color.gray4)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(
                                                    (activity != .disease && activity != .health ?
                                                        self.progress : 1.0), 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: CGFloat(lineWidth), lineCap: .round, lineJoin: .round))
                    .foregroundColor(color)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
                Image( badge ? activity.imageName : activity.coloredImageName )
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.6)
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
            .border(Color.green)
            if labelEnabled {
                HStack {
                    Spacer()
                    let title = activity.title
                    Text("\(title)")
                        .font(.title3)
                    Spacer()
                }.padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
            }
        }
    }
}
