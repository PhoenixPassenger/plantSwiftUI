//
//  ModalActivity.swift
//  plantatinhas (iOS)
//
//  Created by Rodrigo Silva Ribeiro on 20/05/21.
//

import SwiftUI

struct ModalActivity: View {
    @State var progressValue: Float = 1
    @State var typeOfActivity: Activity = Activity.water
    @State var isBadgeActive: Bool = false
    @State var timeleft: Int = 0
    @State private var showConnectionAlert = false
    @State var diseaseIndicator = Activity.disease
    @Binding var isOn: Bool

    var label = "Water"
    var body: some View {
        HStack(alignment: .center, spacing: 10){
            ProgressBar(progress: self.$progressValue,
                        activity: self.$typeOfActivity,
                        badge: self.$isBadgeActive,
                        timeLeft: self.$timeleft,
                        lineWidth: 5)
                .frame(width: 50, height: 50)
                .foregroundColor(.black)
//                .padding(10)
            Text(label)
                .fontWeight(.semibold)
                .font(.system(size: 22))
                .foregroundColor(.colorFont2)
            Spacer()
            Toggle("", isOn: $isOn)
                .labelsHidden()
        }.padding(20)
    }
}
