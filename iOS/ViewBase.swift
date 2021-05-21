//
//  ViewBase.swift
//  plantatinhas (iOS)
//
//  Created by Cecilia Soares on 19/05/21.
//

import SwiftUI

struct ViewBase: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(minWidth: 0, maxWidth: geometry.size.width,
                           minHeight: geometry.size.height, maxHeight: .infinity,
                           alignment: .bottom)
                    .colorInvert()
                    .cornerRadius(40, antialiased: true)
                    .padding(.leading, 1)
            }.cornerRadius(45.0)

        }
    }
}

struct ViewBase_Previews: PreviewProvider {
    static var previews: some View {
        ViewBase()
    }
}
