//
//  List.swift
//  plantatinhas Extension
//
//  Created by Paulo Uchôa on 20/05/21.
//

import SwiftUI

struct ListActivities: View {
    
    @Binding var activity: Activity
    var testeFetch: [PlantModel] = [PlantModel(name: "robertinho", water: nil, harvest: nil, fertilize: nil, disease: false, profilePhoto: nil, photos: nil)]
    
    var body: some View {
        let color = Color("\(activity)")
        VStack {
            HStack {
                Text("\(activity.title) Hoje")
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                Spacer()
                Image(systemName: "bell")
                    .font(.system(size: 20))
                    .foregroundColor(.topBackground)
            }
            List(testeFetch) { teste in
                HStack {
                    Rectangle()
                        .stroke(color,style: StrokeStyle(lineWidth: 3.5))
                        .frame(width: 20, height: 20, alignment: .center)
                        .cornerRadius(2)
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
