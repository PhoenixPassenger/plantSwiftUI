//
//  PlantWorker.swift
//  plantatinhas
//
//  Created by Cecilia Soares on 13/05/21.
//

import Foundation
import SwiftUI
import CoreData

class PlantWorker {
    @Environment(\.managedObjectContext) private var viewContext
    private var plant: Plant?
    func create(plant: PlantModel) {
        let newPlant = Plant(context: viewContext)
        newPlant.name = plant.name
        newPlant.disease = plant.disease
        newPlant.profilePhoto = plant.profilePhoto
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
    }
    func fetchPlants() -> [Plant] {
        let fetch = Plant.fetchRequest() as NSFetchRequest <Plant>
        var plants: [Plant] = []

        do {
            plants = try viewContext.fetch(fetch)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return plants
    }
    func delete(plant: Plant) {
        viewContext.delete(plant)
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("Could not delete. \(error), \(error.userInfo)")
        }
    }
    func update(for plant: Plant, newPlant: PlantModel) {
        plant.name = newPlant.name
        plant.disease = newPlant.disease
        plant.profilePhoto = (newPlant.profilePhoto != nil) ? newPlant.profilePhoto : plant.profilePhoto
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("Could not update. \(error), \(error.userInfo)")
        }
    }
}
