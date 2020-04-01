//
//  VehicleCollectionViewCell.swift
//  CarDealer
//
//  Created by Kenny on 3/27/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import UIKit

class VehicleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var makeModelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    var vehicle: Vehicle? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {
        guard let makeModel = makeModelLabel,
            let price = priceLabel,
            let vehicle = vehicle
        else { return }
        makeModel.text = "\(vehicle.make.rawValue) \(vehicle.model.rawValue)"
        if let vehiclePrice = vehicle.price {
            price.text = "\(vehiclePrice)"
        }
    }
}
