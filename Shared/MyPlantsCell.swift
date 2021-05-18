//
//  MyPlantsCell.swift
//  plantatinhas
//
//  Created by Larissa Uchoa on 18/05/21.
//

import SwiftUI
import UIKit

struct MyPlantsCell: View {

    @State var isSick = true

    var body: some View {
        ZStack {
            HStack {
                Image("robertinho")
                    .resizable()
                    .frame(width: 70, height: 70, alignment: .center)
                    .cornerRadius(35)
                    .aspectRatio(contentMode: .fill)
                    .padding(.leading, 16)

                VStack(alignment: .leading) {
                    Text("Planta")
                        .fontWeight(.medium)
                        .font(.system(size: 22))
                    if isSick {
                        HStack(spacing: 3) {
                            Image(systemName: "pencil.circle.fill")
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
        .background(Color(UIColor.init(red: 253/255, green: 253/255, blue: 253/255, alpha: 1)))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        .border(Color(UIColor.init(red: 235/255, green: 235/255, blue: 235/255, alpha: 0.2)), width: 1)
    }
}

struct MyPlantsCell_Previews: PreviewProvider {
    static var previews: some View {
        MyPlantsCell()
    }
}
