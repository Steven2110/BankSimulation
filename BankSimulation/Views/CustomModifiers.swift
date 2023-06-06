//
//  CustomModifiers.swift
//  BankSimulation
//
//  Created by Steven Wijaya on 07.06.2023.
//

import SwiftUI

struct InputTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(5)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray))
    }
}
