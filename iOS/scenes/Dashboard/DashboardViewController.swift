//
//  DashboardViewController.swift
//  plantatinhas (iOS)
//
//  Created by Cecilia Soares on 18/05/21.
//

import SwiftUI
let coloredNavAppearance = UINavigationBarAppearance()
struct DashboardViewController: View {
    var body: some View {
        ZStack {
            Color.topBackground
                .ignoresSafeArea()
            VStack {
                Text("Cuidados de Hoje")
                    .bold()
                Circle()
                    .fill(Color.white)
                    .frame(width: 100, height: 50)
                ViewBase().ignoresSafeArea()

            }

            VStack {
                Text("Oi")

            }
        }
    }
}
struct DashboardViewController_Previews: PreviewProvider {
    static var previews: some View {
        DashboardViewController()
    }
}
