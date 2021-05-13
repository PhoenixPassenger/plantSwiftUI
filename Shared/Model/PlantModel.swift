//
//  PlantModel.swift
//  plantatinhas (iOS)
//
//  Created by Cecilia Soares on 13/05/21.
//

import Foundation

class PlantModel {
    var name: String?
    var water: Date?
    var harvest: Date?
    var fertilize: Date?
    var disease: Bool
    var profilePhoto: String?
    var photos: String?

    init(name: String?, water: Date?, harvest: Date?,
         fertilize: Date?, disease: Bool, profilePhoto: String?, photos: String? ) {
        self.name = name
        self.water = water
        self.harvest = harvest
        self.fertilize = fertilize
        self.disease = disease
        self.profilePhoto = profilePhoto
        self.photos = photos
    }
}
