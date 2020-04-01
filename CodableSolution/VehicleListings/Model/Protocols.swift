//
//  Protocols.swift
//  VehicleListings
//
//  Created by Kenny on 3/30/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import Foundation

protocol Vehicle {
    //get only look
    //get set change value (mutable)
    var make: Make { get }
    var model: Model { get }
    var body: Body { get set }
    var price: Int { get set }
}

protocol Drivable: Vehicle {
    var engine: Engine { get set }
    var wheels: Int { get set }
}

extension Vehicle {
    private var driveable: Bool {
        return self is Drivable
    }

    func start() {
        if driveable {
            print("Starting the \(make.rawValue) \(model.rawValue)\nVroom")
        } else {
            print("\(make.rawValue) \(model.rawValue) has no engine!")
        }
    }
}
