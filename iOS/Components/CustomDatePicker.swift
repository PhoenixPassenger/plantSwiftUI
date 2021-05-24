//
//  DatePicker.swift
//  plantatinhas (iOS)
//
//  Created by Rodrigo Silva Ribeiro on 20/05/21.
//

import SwiftUI

struct CustomDatePicker: View {
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    let hourFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.dateFormat = "HH:mm a"
        return formatter
    }()
    @State private var day = Date()
    @State private var hour = Date()
    var body: some View {
        VStack {
            HStack {
                Text("Última ").font(.title3).padding(10)
                Spacer()
            }
            HStack {
                DatePicker("", selection: $day, in: ...Date(), displayedComponents: .date)
                    .labelsHidden()
                    .accentColor(.fontCreatePlant)
                DatePicker("", selection: $hour, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .accentColor(.fontCreatePlant)
            }
        }
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            CustomDatePicker().preferredColorScheme($0)
        }
    }
}
