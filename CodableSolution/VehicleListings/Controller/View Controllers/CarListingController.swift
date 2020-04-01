//
//  CarListingController.swift
//  VehicleListings
//
//  Created by Kenny on 3/30/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import UIKit

class CarListingController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var carController = CarController()

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //let skylark = Beater(make: .buick, model: .skylark, body: .rustedOut, price: 500)
        var fusion = Car(engine: .v6, wheels: 4, make: .ford, model: .fusion, body: .plexiglass, price: 10000)
        //carController.addCarToList(car: skylark)
        carController.addCarToList(car: fusion)
        fusion.wheels = 2
        carController.updateCar(car: fusion)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

extension CarListingController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        carController.cars.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VehicleCell", for: indexPath) as? VehicleCollectionViewCell else { fatalError("You forgot the identifier, Kenny") }
        cell.car = carController.cars[indexPath.item]
        return cell
    }
}

extension CarListingController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: self.view.frame.width / 3, height: 200)
    }
}


