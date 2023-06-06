//
//  InformationView.swift
//  BankSimulation
//
//  Created by Steven Wijaya on 07.06.2023.
//

import SwiftUI

struct InformationView: View {
    
    var totalPerson: Int
    var queue: Int
    var busyOperators: Int
    var time: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Number of people in bank")
                    .bold()
                    .font(.title2)
                Text("\(totalPerson)").font(.title2)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text("Number of people in queue")
                    .bold()
                    .font(.title2)
                Text("\(queue)").font(.title2)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text("Number of busy operators")
                    .bold()
                    .font(.title2)
                Text("\(busyOperators)").font(.title2)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text("Time")
                    .bold()
                    .font(.title2)
                Text("\(time, specifier: "%.2f") s").font(.title2)
            }
        }.padding(.top)
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(totalPerson: 20, queue: 10, busyOperators: 10, time: 12.03)
    }
}
