//
//  ProductListPresenter.swift
//  VProducts
//
//  Created by Andrii Ilnitskyi on 01.04.2020.
//  Copyright © 2020 Andrii Ilnitskyi. All rights reserved.
//

import Foundation

protocol ProductListPresenterProtocol: class {
    func viewLoaded()
    
    func productListFetched(_ products: [Product])
    func productListFetchFailed(_ error: String)
}

class ProductListPresenter: ProductListPresenterProtocol {
    var iterator: ProductListIteratorProtocol!
    var router: ProductListRouterProtocol!
    weak var view: ProductListViewProtocol?
    
    func viewLoaded() {
        view?.setup()
        view?.showLoader()
        iterator?.fetchProducts()
    }
    
    func productListFetched(_ products: [Product]) {
        view?.hideLoader()
        view?.reloadData(products: products)
    }
    
    func productListFetchFailed(_ error: String) {
        view?.hideLoader()
        router.showDialog(text: "Error: \(error)")
    }
}
