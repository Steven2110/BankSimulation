//
//  BankModel.swift
//  BankSimulation
//
//  Created by Rafael Matthew on 07.06.2023.
//

import Foundation

struct BankModel: Identifiable{
    var id: UUID = UUID()
    var time: Double
    var queue: Int
    var busyOperator: Int
}