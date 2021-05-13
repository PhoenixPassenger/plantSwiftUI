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
    func update(for plant: Plant, name: String?, water: Date?, harvest: Date?,
                fertilize: Date?, disease: Bool, profilePhoto: String?, photos: String?) {
        plant.name = (name != nil) ? name : plant.name
        plant.water = (water != nil) ? water : plant.water
        plant.harvest = (harvest != nil) ? harvest : plant.harvest
        plant.fertilize = (fertilize != nil) ? fertilize : plant.fertilize
        plant.disease = disease
        plant.profilePhoto = (profilePhoto != nil) ? profilePhoto : plant.profilePhoto
        plant.photos = (photos != nil) ? photos : plant.photos
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("Could not update. \(error), \(error.userInfo)")
        }
    }
}
