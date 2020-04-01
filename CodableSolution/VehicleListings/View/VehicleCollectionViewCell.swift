//
//  VehicleCollectionViewCell.swift
//  VehicleListings
//
//  Created by Kenny on 3/30/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import UIKit

class VehicleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var makeModelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    // MARK: - Properties
    var vehicle: Vehicle? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {
        guard let makeModel = makeModelLabel,
            let price = priceLabel,
            let vehicle = vehicle else { return }

        makeModel.text = "\(vehicle.make.rawValue) \(vehicle.model.rawValue)"
        price.text = "\(vehicle.price)"
    }    
}
