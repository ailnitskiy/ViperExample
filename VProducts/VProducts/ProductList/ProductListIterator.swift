//
//  ProductListIteratori.swift
//  VProducts
//
//  Created by Andrii Ilnitskyi on 01.04.2020.
//  Copyright © 2020 Andrii Ilnitskyi. All rights reserved.
//

import Foundation

protocol ProductListIteratorProtocol: class {
    func fetchProducts()
}

class ProductListIterator: ProductListIteratorProtocol {
    weak var presenter: ProductListPresenterProtocol?
    
    func fetchProducts() {
        //loading data from server
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {[weak self] in
//            self?.presenter.productListFetchFailed("fjslfj")
            self?.presenter?.productListFetched([Product(name: "Product 1", description: "Info 1", price: 50), Product(name: "Product 2", description: "Info 2", price: 20), Product(name: "Product 3", description: "Info 3", price: 90)])
        }
    }
}
