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

    }

    //MARK: - Properties

    //Vehicles
    let carsPlist = "Cars.plist"
    var cars: [Car] = []

    //persistence
    var persistentURL: URL? {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let url = documents?.appendingPathComponent(carsPlist)
        return url
    }

    //MARK: - Init
    init() {
        checkPersistence()
    }

    //MARK: - Create
    func addCarToList(car: Car) {
        cars.append(car)
        saveToPersistentStore()
    }

    //MARK: - Read
    func loadList() {
        guard let persistentURL = persistentURL else { return }
        do {
            //Set up the decoder
            let decoder = PropertyListDecoder()
            let carData = try Data(contentsOf: persistentURL)
            let cars = try decoder.decode([Car].self, from: carData)
            #warning("🛑 Decodable (talk about how every type in the chain needs to conform to Decodable)")
            self.cars = cars
        } catch let loadError {
            print(loadError)
        }
    }

    //MARK: - Update
    func updateCar(car: Car) {
        var arrayCar = cars.first { (thisCar) -> Bool in
            thisCar == car
        }
        if arrayCar != nil {
            arrayCar = car
        }
    }

    //MARK: - Delete
    func deleteCarFromList(car: Car) {
        guard let arrayCar = cars.firstIndex(of: car) else { return }
        cars.remove(at: arrayCar)
    }

    func saveToPersistentStore() {
        guard let persistentURL = persistentURL else { return }
        do {
            //Set up the decoder
            let encoder = PropertyListEncoder()

            let carData = try encoder.encode(self.cars)
            #warning("🛑 Encodable (talk about how every type in the chain needs to conform to Encodable)")
            try carData.write(to: persistentURL)
        } catch let loadError {
            print(loadError)
        }
    }

    //Helper Methods
    private func checkPersistence() {
        loadList()
        if cars.isEmpty {
            //load from network
        }
    }
}
