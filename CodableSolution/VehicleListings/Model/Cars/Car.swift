//
//  Car.swift
//  VehicleListings
//
//  Created by Kenny on 3/30/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//
import Foundation

struct Car: Drivable, Codable, Equatable {
    var id: UUID = UUID()
    var engine: Engine
    var wheels: Int
    var make: Make
    var model: Model
    var body: Body
    var price: Int

    static func == (lhs: Car, rhs: Car) -> Bool {
        lhs.id == rhs.id
    }
}
