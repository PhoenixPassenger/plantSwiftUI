//
//  DayPicker.swift
//  plantatinhas
//
//  Created by Rodrigo Silva Ribeiro on 19/05/21.
//

import SwiftUI

struct DayPicker: View {
    @State var seg: String = "Seg"
    @State var ter: String = "Ter"
    @State var qua: String = "Qua"
    @State var qui: String = "Qui"
    @State var sex: String = "Sex"
    @State var sab: String = "Sab"
    @State var dom: String = "Dom"
    @State var selected = [Bool](repeating: false, count: 7)
    var body: some View {
        VStack {
            HStack {
                Text("Dias: ").font(.title2).padding(10)
                Spacer()
            }
            HStack {
                Button(action: toggle(id: 0)) {
                    TextDay(text: self.$seg, selected: self.$selected[0])
                }
                Button(action: toggle(id: 1)) {
                    TextDay(text: self.$ter, selected: self.$selected[1])
                }
                Button(action: toggle(id: 2)) {
                    TextDay(text: self.$qua, selected: self.$selected[2])
                }
                Button(action: toggle(id: 3)) {
                    TextDay(text: self.$qui, selected: self.$selected[3])
                }
            }
            HStack {
                Button(action: toggle(id: 4)) {
                    TextDay(text: self.$sex, selected: self.$selected[4])
                }
                Button(action: toggle(id: 5)) {
                    TextDay(text: self.$sab, selected: self.$selected[5])
                }
                Button(action: toggle(id: 6)) {
                    TextDay(text: self.$dom, selected: self.$selected[6])
                }
            }
        }
    }
    private func toggle(id: Int) -> () -> Void {
        return {
            self.selected[id] = !self.selected[id]
        }
    }
}

struct TextDay: View {
    @Binding var text: String
    @Binding var selected: Bool
    var body: some View {
        Text(text)
            .padding(EdgeInsets(top: 5, leading: 12, bottom: 5, trailing: 12))
            .background(!selected ? Color.gray4 : Color.health)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .foregroundColor(!selected ? Color.black : Color.fontGreen)
            .font(.body)
    }
}

struct DayPicker_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            DayPicker().preferredColorScheme($0)
        }
    }
}
