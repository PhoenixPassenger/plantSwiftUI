//
//  PlantModel.swift
//  plantatinhas (iOS)
//
//  Created by Cecilia Soares on 13/05/21.
//

import Foundation

class PlantModel: Identifiable {
    var name: String
    var disease: Bool
    var profilePhoto: Data?
    
    init(name: String, disease: Bool, profilePhoto: Data? ) {
        self.name = name
        self.disease = disease
        self.profilePhoto = profilePhoto
    }
}
class TestCoreData {
    
}
