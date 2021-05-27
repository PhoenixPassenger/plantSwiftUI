//
//  ImagePicker.swift
//  plantatinhas
//
//  Created by Rodrigo Silva Ribeiro on 19/05/21.
//

import SwiftUI

struct DetailsHeader: View {
    @Binding var image: Activity
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 100, height: 100)
            VStack {
                Image(systemName: "person.fill")
                    .frame(width: 100, height: 100)
                    .background(Color.fontGreen)
                    .cornerRadius(50)
                Text("Nome")
                    .font(.title2)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
            }
            Image("\(image)")
                .resizable()
                .frame(width: 74, height: 100)
                .offset(x: 0, y: 50)
                .padding(.leading, 40)
        }
    }
}
