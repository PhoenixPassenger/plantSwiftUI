//
//  SegmentedControl.swift
//  plantatinhas
//
//  Created by Rodrigo Silva Ribeiro on 19/05/21.
//

import SwiftUI

struct SegmentedControl: View {
    @State private var typeOfCount = "Semanal"
    @State private var timeCount = 18
    var types = ["Semanal", "Mensal"]
    var body: some View {
        HStack {
            Spacer()
            VStack {
                HStack {
                    Text("Frequência").font(.title3).padding(10)
                    Spacer()
                }
                Picker(selection: $typeOfCount, label: Text("")) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                Stepper("A cada \(timeCount) \(typeOfCount == "Semanal" ? "semanas" : "meses")", onIncrement: {
                    timeCount += 1
                }, onDecrement: {
                    timeCount -= 1
                })
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 20))
            }
        }
    }
}

struct SegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControl()
    }
}
