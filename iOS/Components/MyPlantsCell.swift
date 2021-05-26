//
//  MyPlantsCell.swift
//  plantatinhas
//
//  Created by Larissa Uchoa on 18/05/21.
//

import SwiftUI
import UIKit

struct MyPlantsCell: View {

    @State var plant: PlantModel

    var body: some View {
        ZStack {
            HStack {
                Image(plant.name)
                    .resizable()
                    .frame(width: 70, height: 70, alignment: .center)
                    .cornerRadius(35)
                    .aspectRatio(contentMode: .fill)
                    .padding(.leading, 16)

                VStack(alignment: .leading) {
                    Text(plant.name)
                        .fontWeight(.medium)
                        .font(.system(size: 22))
                    if plant.disease {
                        HStack(spacing: 3) {
                            Circle().overlay(
                                                Image("disease-cell")
                                                    .resizable()
                                                    .frame(width: 12, height: 17, alignment: .center)
                                                    .accentColor(.health)
                            )
                                .frame(width: 22, height: 22, alignment: .center)
                            .foregroundColor(.topBackground)
                            Text("Doente")
                                .fontWeight(.regular)
                                .font(.system(size: 15))
                        }
                    }
                }
                .padding(.leading, 8)
                Spacer()
            }
        }
        .frame(height: 92, alignment: .leading)
        .background(Color.plantListCell)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        .border(Color.borderPlantListCell)
    }
}

//struct MyPlantsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            MyPlantsCell()
//            MyPlantsCell()
//                .preferredColorScheme(.dark)
//        }
//    }
//}
