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
        } catch {
            print("error")
        }
    }
    func fetchPlants() -> [Plant] {
        let fetch = Plant.fetchRequest() as NSFetchRequest <Plant>
        var plants: [Plant] = []

        do {
            plants = try viewContext.fetch(fetch)
        } catch {
            print("error")
        }
        return plants
    }
    func delete(plant: Plant) {
        viewContext.delete(plant)
        do {
            try viewContext.save()
        } catch {
            print("error")
        }
    }
}
