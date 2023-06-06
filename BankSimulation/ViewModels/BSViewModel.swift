//
//  BSViewModel.swift
//  BankSimulation
//
//  Created by Rafael Matthew on 07.06.2023.
//

import Foundation

final class BSViewModel: ObservableObject {

    @Published var bank: [BankModel] = [BankModel]()

    private var N = 10
    private var x = 0 // Busy operator
    private var y = 0 // Number of person in queue
    private var lmb: Int = 0
    private var miu: Double = 0.0
    private var tao: Double = 0.0
    private var delta: Double = 0.0
    private var t: Double = 0.0

    func setValue(N: Int, lambdaParams: Int, miuParams: Double) {
        self.N = N
        let dispatchGroup = DispatchGroup()

        dispatchGroup.enter()
        NetworkManager.getData(url: "http://127.0.0.1:5000/poisson", parameter: ["lambda": String(lambdaParams)], dataKind: Result.self) { data in
        self.lmb = Int(data.rv)
        dispatchGroup.leave()
        }
        dispatchGroup.enter()
        NetworkManager.getData(url: "http://127.0.0.1:5000/exponential", parameter: ["lambda": String(miuParams)], dataKind: Result.self) { data in
        self.miu = data.rv
        dispatchGroup.leave()
        }

        dispatchGroup.notify(queue: .main) {
        print("FINISHED")
        }
    }

    func start() {
        DispatchQueue.main.async {
        NetworkManager.getData(url: "http://127.0.0.1:5000/exponential", parameter: ["lambda": "10.0"], dataKind: Result.self, completion: { data in
        self.tao = data.rv
        })
        }

        print(tao)

        if x > 0 {
            DispatchQueue.main.async { [self] in
                let localLambda = miu * Double(x)
                NetworkManager.getData(url: "http://127.0.0.1:5000/exponential", parameter: ["lambda": String(localLambda)], dataKind: Result.self, completion: { data in
                self.delta = data.rv
                })
            }

        } else {
            delta = Double.infinity
        }
        print("Tao: \(tao)")
        print("Delta: \(delta)")
        if (tao < delta) {
            if x < N {
                x = x + 1
            } else {
                y = y + 1
                if y >= 15 {
                    y = y - 1
                }   
            }
            t = t + tao
            print("WITH TAO")
            print(t)
        } else {
            if y == 0 {
                x = x - 1
            } else {
                y = y - 1
            }
            t = t + delta
            print("WITH DELTA")
            print(t)
        }

        print("X: \(x)")
        print("Y: \(y)")
        print("t: \(t)")


        let currentState = BankModel(time: t, queue: y, busyOperator: x)
        bank.append(currentState)
        // queue.append(y)
        // busyOperators.append(x)

    }
}
