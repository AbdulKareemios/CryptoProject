//
//  UIApplication.swift
//  CryptoProject
//
//  Created by AK on 5/17/24.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func ednEditing() {
        
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
