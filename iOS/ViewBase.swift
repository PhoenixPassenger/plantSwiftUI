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
                    .colorInvert()
                    .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
                    .padding(.leading, 0)
                    
            }
        }
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius,
                                                    height: radius))
        return Path(path.cgPath)
    }
}

struct ViewBase_Previews: PreviewProvider {
    static var previews: some View {
        ViewBase()
    }
}
