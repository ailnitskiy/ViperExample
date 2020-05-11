//
//  ProductCell.swift
//  VProducts
//
//  Created by Andrii Ilnitskyi on 01.04.2020.
//  Copyright © 2020 Andrii Ilnitskyi. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var product: Product! {
        didSet {
            nameLabel.text = product.name
            descriptionLabel.text = product.description
            priceLabel.text = "$\(product.price)"
        }
    }
}
