//
//  WaterModel.swift
//  plantatinhas
//
//  Created by Cecilia Soares on 24/05/21.
//

import Foundation

class WaterModel: Identifiable {
    var exist: Bool
    var notification: Bool
    var done: Bool
    var date: Date?
    init(exist: Bool, notification: Bool, done: Bool, date: Date? ) {
        self.exist = exist
        self.notification = notification
        self.done = done
        self.date = date
    }
}
