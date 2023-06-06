//
//  BSMainView.swift
//  BankSimulation
//
//  Created by Steven Wijaya on 06.06.2023.
//

import SwiftUI

struct BSMainView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BSMainView()
    }
}
