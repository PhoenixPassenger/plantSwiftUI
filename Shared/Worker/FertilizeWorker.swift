//
//  FertilizeWorker.swift
//  plantatinhas
//
//  Created by Cecilia Soares on 24/05/21.
//

import Foundation
import SwiftUI
import CoreData

class FertilizeWorker {
    @Environment(\.managedObjectContext) private var viewContext
    private var fertilize: Fertilize?
    let plant: Plant
    init(_ plant: Plant) {
        self.plant = plant
    }
    func create(fertilize: FertilizeModel) {
        let plantFertilize = Fertilize(context: viewContext)
        plantFertilize.exist = fertilize.exist
        plantFertilize.done = fertilize.done
        plantFertilize.notification = fertilize.notification
        plantFertilize.date = fertilize.date
        plantFertilize.interval = Int32(fertilize.interval)
        plantFertilize.isMonthly = fertilize.isMonthly
        plantFertilize.plant = self.plant
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
    }
    func fetchPlants() -> [Fertilize] {
        let fetch = Fertilize.fetchRequest() as NSFetchRequest <Fertilize>
        var plantsFertilize: [Fertilize] = []

        do {
            plantsFertilize = try viewContext.fetch(fetch)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return plantsFertilize
    }
    func delete(fertilize: Fertilize) {
        viewContext.delete(fertilize)
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("Could not delete. \(error), \(error.userInfo)")
        }
    }
    func update(for fertilize: Fertilize, newFertilize: FertilizeModel) {
        fertilize.exist = newFertilize.exist
        fertilize.done = newFertilize.done
        fertilize.notification = newFertilize.notification
        fertilize.isMonthly = newFertilize.isMonthly
        fertilize.date = (newFertilize.date != nil) ? newFertilize.date : fertilize.date
        fertilize.interval = Int32(newFertilize.interval)
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("Could not update. \(error), \(error.userInfo)")
        }
    }
}
