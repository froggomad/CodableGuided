//
//  VehicleController.swift
//  VehicleListings
//
//  Created by Kenny on 3/31/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

//
//  VehicleController.swift
//  CarDealer
//
//  Created by Kenny on 3/31/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import Foundation

class CarController {
    //MARK: - Types
    private enum PlistFilename: String {
        case beatersPlist = "Beaters.plist"
        case carsPlist = "Cars.plist"
    }

    //MARK: - Properties

    //Vehicles
    var vehicles: [Vehicle] = []
    var cars: [Car] {
        guard let carArr = vehicles.filter({ $0 is Car }) as? [Car] else { return [] }
        return carArr
    }
    var beaters: [Beater] {
        guard let beaterArr = vehicles.filter({ $0 is Beater }) as? [Beater] else { return [] }
        return beaterArr
    }

    //persistence
    var persistentFilename = PlistFilename.carsPlist.rawValue
    var persistentURL: URL? {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let url = documents?.appendingPathComponent(persistentFilename)
        return url
    }

    //MARK: - Init
    init() {
        //initialize our persistentFilename
        self.persistentFilename = PlistFilename.beatersPlist.rawValue
    }

    //MARK: - CRUD
    func addVehicleToList() {

    }

    func loadList(cars: Bool) {
        setFilename(cars: cars)
    }

    func updateList(cars: Bool) {
        setFilename(cars: cars)

    }

    func deleteCarFromList(cars: Bool) {
        setFilename(cars: cars)

    }

    func saveToPersistentStore(cars: Bool) {
        setFilename(cars: cars)
    }

    //Helper Methods
    private func checkPersistence() {
        loadList(cars: true)
    }
    private func setFilename(cars: Bool) {
        if cars {
            persistentFilename = PlistFilename.carsPlist.rawValue
        } else {
            persistentFilename = PlistFilename.beatersPlist.rawValue
        }
    }

}

