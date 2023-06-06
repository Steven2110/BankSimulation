//
//  ViewExt.swift
//  BankSimulation
//
//  Created by Steven Wijaya on 07.06.2023.
//

import Foundation
import SwiftUI

extension View {
    
    func inputTextField() -> some View {
        self.modifier(InputTextField())
    }
    
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
