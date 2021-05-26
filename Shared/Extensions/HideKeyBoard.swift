//
//  HideKeyBoard .swift
//  plantatinhas
//
//  Created by Paulo Uchôa on 25/05/21.
//

import Foundation
import SwiftUI

//#if canImport(UIKit)
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
//#endif
