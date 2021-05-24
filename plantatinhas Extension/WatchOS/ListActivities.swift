//
//  List.swift
//  plantatinhas Extension
//
//  Created by Paulo Uchôa on 20/05/21.
//

import SwiftUI

struct ListActivities: View {

//    @State var notification: Bool = true
    @State var done: Bool = false // Trocar pela variável plant.water.done
    @Binding var activity: Activity
    var testeFetch: [PlantModel] = [PlantModel(name: "robertinho",
                                               water: nil,
                                               harvest: nil,
                                               fertilize: nil,
                                               disease: false,
                                               profilePhoto: nil,
                                               photos: nil)]
    //Trocar pela variável Plant vinda do banco

    var body: some View {
        let color = Color("\(activity)")
        VStack {
            HStack {
                Text("\(activity.title) Hoje")
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                Spacer()
                //Notification
//                Button(action: { if notification == true {
//                    notification = false
//                } else {
//                    notification = true
//                }
//                    }, label: {
//
//                    if notification == true {
//                        Image(systemName: "bell.fill")
//                            .font(.system(size: 20))
//                            .foregroundColor(.topBackground)
//                    } else {
//                        Image(systemName: "bell")
//                            .font(.system(size: 20))
//                            .foregroundColor(.topBackground)
//                    }
//                    }).buttonStyle(BorderedButtonStyle(tint: .blue.opacity(0)))
//                .frame(minWidth: 25, idealWidth: 25, maxWidth: 25, minHeight: 15, idealHeight: 15, maxHeight: 15)
            }
            List(testeFetch) { teste in
                HStack {
                    Button(action: {
                        if done == false {
                            done = true
                        } else {
                            done = false
                        }
                    }, label: {
                        if done == false {
                            Rectangle()
                                .stroke(color, style: StrokeStyle(lineWidth: 3.5))
                                .frame(width: 18, height: 18, alignment: .center)
                                .cornerRadius(2)
                        } else {
                            Image(systemName: "checkmark.square.fill")
                                .font(.system(size: 20))
                                .foregroundColor(color)
                        }
                    }).buttonStyle(BorderedButtonStyle(tint: .blue.opacity(0)))
                    .frame(minWidth: 25, idealWidth: 25, maxWidth: 25, minHeight: 15, idealHeight: 15, maxHeight: 15)
                    .padding(.leading, 5)

                    Text(teste.name!)
                        .padding(.leading, 6)
                }
            }.listStyle(CarouselListStyle())
            .overlay(
                Text(testeFetch.isEmpty ? "Nenhuma planta para regar." : "")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 15))
                    .foregroundColor(Color(UIColor(red: 58/255, green: 58/255, blue: 60/255, alpha: 1)))
            )
        }
    }
}

//struct List_Previews: PreviewProvider {
//    static var previews: some View {
//        ListActivities()
//    }
//}
