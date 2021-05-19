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
        newPlant.fertilize = plant.fertilize
        newPlant.harvest = plant.harvest
        newPlant.water = plant.water
        newPlant.profilePhoto = plant.profilePhoto
        newPlant.photos = plant.photos
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
        plant.name = (newPlant.name != nil) ? newPlant.name : plant.name
        plant.water = (newPlant.water != nil) ? newPlant.water : plant.water
        plant.harvest = (newPlant.harvest != nil) ? newPlant.harvest : plant.harvest
        plant.fertilize = (newPlant.fertilize != nil) ? newPlant.fertilize : plant.fertilize
        plant.disease = newPlant.disease
        plant.profilePhoto = (newPlant.profilePhoto != nil) ? newPlant.profilePhoto : plant.profilePhoto
        plant.photos = (newPlant.photos != nil) ? newPlant.photos : plant.photos
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("Could not update. \(error), \(error.userInfo)")
        }
    }
}
