//
//  dataToImage.swift
//  plantatinhas (iOS)
//
//  Created by Rodrigo Silva Ribeiro on 27/05/21.
//

import UIKit
import SwiftUI
extension Image {
    func pngDataToImage(_ data: Data) -> Image {
        let uiImage = UIImage(data: data) ?? UIImage()
        let image = Image(uiImage: uiImage)
        return image
    }
}
