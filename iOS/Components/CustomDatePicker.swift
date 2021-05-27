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
        formatter.dateFormat = "H:mm a"
        return formatter
    }()
    func getFinalDate() {
        let date = dateFormatter.string(from: self.day)
        let time = hourFormatter.string(from: self.hour)
        print(time)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy 'at' h:mm a"
        let string = date + " at " + time                       // "March 24, 2017 at 7:00 AM"
        let finalDate = dateFormatter.date(from: string)
        self.date = finalDate ?? Date()
    }
    @State private var day = Date()
    @State private var hour = Date()
    @Binding var date: Date
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
                    .onChange(of: day) {_ in
                        getFinalDate()
                    }
                DatePicker("", selection: $hour, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .accentColor(.fontCreatePlant)
                    .onChange(of: hour) {_ in
                        getFinalDate()
                    }
            }
        }
    }
}

//struct CustomDatePicker_Previews: PreviewProvider {
//    static var previews: some View {
//        ForEach(ColorScheme.allCases, id: \.self) {
//            CustomDatePicker().preferredColorScheme($0)
//        }
//    }
//}
