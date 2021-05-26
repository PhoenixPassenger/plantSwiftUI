//
//  HarvestWorker.swift
//  plantatinhas
//
//  Created by Cecilia Soares on 24/05/21.
//

import Foundation
import SwiftUI
import CoreData

class HarvestWorker {
    let viewContext = PersistenceController.shared.container.viewContext
    private var harvest: Harvest?
    let plant: Plant
    init(_ plant: Plant) {
        self.plant = plant
    }
    func create(harvest: HarvestModel) {
        let plantHarvest = Harvest(context: viewContext)
        plantHarvest.exist = harvest.exist
        plantHarvest.done = harvest.done
        plantHarvest.notification = harvest.notification
        plantHarvest.date = harvest.date
        plantHarvest.interval = Int32(harvest.interval)
        plantHarvest.isMonthly = harvest.isMonthly
        plantHarvest.plant = self.plant

        do {
            try viewContext.save()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
    }
    func fetchPlants() -> [Harvest] {
        let fetch = Harvest.fetchRequest() as NSFetchRequest <Harvest>
        var plantsHarvest: [Harvest] = []

        do {
            plantsHarvest = try viewContext.fetch(fetch)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return plantsHarvest
    }
    func delete(harvest: Harvest) {
        viewContext.delete(harvest)
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("Could not delete. \(error), \(error.userInfo)")
        }
    }
    func update(for harvest: Harvest, newHarvest: HarvestModel) {
        harvest.exist = newHarvest.exist
        harvest.done = newHarvest.done
        harvest.notification = newHarvest.notification
        harvest.isMonthly = newHarvest.isMonthly
        harvest.date = (newHarvest.date != nil) ? newHarvest.date : harvest.date
        harvest.interval = Int32(newHarvest.interval)
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("Could not update. \(error), \(error.userInfo)")
        }
    }
}
