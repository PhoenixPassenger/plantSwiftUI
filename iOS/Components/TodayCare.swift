//
//  TodayCare.swift
//  plantatinhas
//
//  Created by Paulo Uchôa on 19/05/21.
//

import SwiftUI

struct TodayCare: View {
    @State var plantsImages: [String] = []
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top, spacing: 20) {
                if !plantsImages.isEmpty {
                    ForEach(plantsImages, id: \.self) { plantsImages in
    //                    NavigationLink(destination: ) {
                            Image(plantsImages)
                                .resizable()
                                .cornerRadius(100)
                                .frame(minWidth: 72,
                                       idealWidth: 92,
                                       maxWidth: 92,
                                       minHeight: 72,
                                       idealHeight: 92,
                                       maxHeight: 92,
                                       alignment: .center)
                                .aspectRatio(contentMode: .fill)
    //                    }

                    }
                } else {
                    Text("Nenhuma atividade para hoje.")
                        .fontWeight(.regular)
                        .font(.system(size: 15))
                        .foregroundColor(.health.opacity(0.8))
                        .padding(.leading, 10)
                }
            }
//            .fixedSize(horizontal: false, vertical: true)
            .frame(alignment: .leading)
            .padding(.leading)
        }
    }
}

struct TodayCare_Previews: PreviewProvider {
    static var previews: some View {
        TodayCare()
    }
}
