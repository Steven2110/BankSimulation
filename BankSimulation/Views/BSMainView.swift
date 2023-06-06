//
//  BSMainView.swift
//  BankSimulation
//
//  Created by Steven Wijaya on 06.06.2023.
//

import SwiftUI
import Charts

struct BSMainView: View {
    
    @StateObject private var vm: BSViewModel = BSViewModel()
    @State private var N: String = ""
    @State private var serviceParams: String = ""
    @State private var arrivalParams: String = ""
    
    @State private var timer: Timer? = nil
    private let timestep: Double = 1.0

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Group {
                    TextField("Number of operators", text: $N).inputTextField()
                    TextField("Arrival parameters", text: $arrivalParams).inputTextField()
                    TextField("Service parameters", text: $serviceParams).inputTextField()
                }.keyboardType(.numberPad)
                Button {
                    vm.setValue(N: Int(N)!, lambdaParams: Int(arrivalParams)!, miuParams: Double(serviceParams)!)
                    timer = Timer.scheduledTimer(withTimeInterval: timestep, repeats: true) { _ in
                        vm.start()
                    }
                } label: {
                    startButton
                }
            }
            .padding()
            .navigationTitle("Bank Simulation")
            VStack {
                Text("Queueing system changes")
                    .bold()
                    .font(.largeTitle)
                Chart(vm.bank) { state in
                    PointMark(x: .value("Time", state.time), y: .value("Number", state.queue))
                        .foregroundStyle(by: .value("Queue", "Queue"))
                    LineMark(x: .value("Time", state.time), y: .value("Number", state.queue))
                        .foregroundStyle(by: .value("Queue", "Queue"))
                    PointMark(x: .value("Time", state.time), y: .value("Number", state.busyOperator))
                        .foregroundStyle(by: .value("Busy Operator", "Busy Operator"))
                    LineMark(x: .value("Time", state.time), y: .value("Number", state.busyOperator))
                        .foregroundStyle(by: .value("Busy Operator", "Busy Operator"))
                }.padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BSMainView()
    }
}

extension BSMainView {
    private var startButton: some View {
        Text("Start")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
