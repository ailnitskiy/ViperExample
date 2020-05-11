//
//  ProductListRouter.swift
//  VProducts
//
//  Created by Andrii Ilnitskyi on 01.04.2020.
//  Copyright © 2020 Andrii Ilnitskyi. All rights reserved.
//

import UIKit

protocol ProductListRouterProtocol {
    func showDialog(text: String)
    //other navigation here
}

class ProductListRouter: ProductListRouterProtocol {
    weak var presenter: ProductListPresenterProtocol?
    var navigationController: UINavigationController!
    
    static func createModule(navigationController: UINavigationController) -> ProductListViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "productListVC") as! ProductListViewController
        let presenter = ProductListPresenter()
        let iteractor = ProductListIterator()
        let router = ProductListRouter()
        
        presenter.iterator = iteractor
        presenter.router = router
        presenter.view = view
        
        view.presenter = presenter
        
        iteractor.presenter = presenter
        
        router.presenter = presenter
        router.navigationController = navigationController
        
        return view
    }
    
    func showDialog(text: String) {
        let alertController = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.navigationController.visibleViewController?.present(alertController, animated: true, completion: nil)
    }
}
