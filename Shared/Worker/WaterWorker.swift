//
//  WaterWorker.swift
//  plantatinhas
//
//  Created by Cecilia Soares on 24/05/21.
//

import Foundation
import SwiftUI
import CoreData

class WaterWorker {
    let viewContext = PersistenceController.shared.container.viewContext
    private var water: Water?
    let plant: Plant
        init(_ plant: Plant) {
            self.plant = plant
        }
    func create(water: WaterModel) {
        let plantWater = Water(context: viewContext)
        plantWater.exist = water.exist
        plantWater.done = water.done
        plantWater.notification = water.notification
        plantWater.date = water.date
        plantWater.plant = self.plant
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
    }
    func fetchPlants() -> [Water] {
        let fetch = Water.fetchRequest() as NSFetchRequest <Water>
        var plantsWater: [Water] = []

        do {
            plantsWater = try viewContext.fetch(fetch)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return plantsWater
    }
    func delete(water: Water) {
        viewContext.delete(water)
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("Could not delete. \(error), \(error.userInfo)")
        }
    }
    func update(for water: Water, newWater: WaterModel) {
        water.exist = newWater.exist
        water.done = newWater.done
        water.notification = newWater.notification
        water.date = (newWater.date != nil) ? newWater.date : water.date
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("Could not update. \(error), \(error.userInfo)")
        }
    }
}
