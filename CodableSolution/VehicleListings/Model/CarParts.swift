//
//  CarParts.swift
//  VehicleListings
//
//  Created by Kenny on 3/30/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import Foundation

//String is the rawValue (Correction from yesterday, NOT an associated value)
//Associated values are much different...
//they're more or less generic which we won't get into until Unit 3 (hand waving)
//Decodable is a protocol we're conforming to
enum Engine: String, Codable {
    case i4 = "Inline-4"
    case i6 = "Inline-6"
    case v6 = "V-6"
    case v8 = "V-8"
    case v10 = "V-10"
    case v12 = "V-12"
}

enum Body: String, Codable {
    case steel = "Steel"
    case plexiglass = "Plexiglass"
    case carbonFiber = "Carbon Fiber"
    case rustedOut = "Rusted Out"
}

//String - associated value
enum Make: String, Codable {
    case buick = "Buick"
    case ford = "Ford"
}

enum Model: String, Codable {
    case skylark = "Skylark"
    case fusion = "Fusion"
}
