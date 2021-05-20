//
//  List.swift
//  plantatinhas Extension
//
//  Created by Paulo Uchôa on 20/05/21.
//

import SwiftUI

struct ListActivities: View {
    
    @State var testeFetch: [String] = ["robertinho", "nsei"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Regar Hoje")
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                Spacer()
                Image(systemName: "bell")
                    .font(.system(size: 20))
                    .foregroundColor(.topBackground)
            }
            List {
                HStack {
                    Rectangle()
                        .stroke(Color.topBackground ,style: StrokeStyle(lineWidth: 3.5))
                        .frame(width: 20, height: 20, alignment: .center)
                        .cornerRadius(2)
                        .padding(.leading, 5)
                    Text("Robert Inho")
                        .padding(.leading, 6)
                }
            }
        }
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        ListActivities()
    }
}
