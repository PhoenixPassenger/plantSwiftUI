//
//  FertilizeModel.swift
//  plantatinhas
//
//  Created by Cecilia Soares on 24/05/21.
//

import Foundation

class FertilizeModel: Identifiable {
    var exist: Bool
    var notification: Bool
    var done: Bool
    var date: Date?
    var interval: Int
    var isMonthly: Bool

    init(exist: Bool, notification: Bool, done: Bool, date: Date?, interval: Int, isMonthly: Bool ) {
        self.exist = exist
        self.notification = notification
        self.done = done
        self.date = date
        self.interval = interval
        self.isMonthly = isMonthly
    }
}
