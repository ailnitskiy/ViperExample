//
//  ViewController.swift
//  VProducts
//
//  Created by Andrii Ilnitskyi on 01.04.2020.
//  Copyright © 2020 Andrii Ilnitskyi. All rights reserved.
//

import UIKit

protocol ProductListViewProtocol: class {
    func setup()
    func showLoader()
    func hideLoader()
    func reloadData(products: [Product])
}

class ProductListViewController: UIViewController {
    let cellId = "productCell"
    
    var presenter: ProductListPresenterProtocol!
    @IBOutlet weak var tableView: UITableView!
    
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
    }


}

extension ProductListViewController: ProductListViewProtocol {
    func setup() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func showLoader() {
        ActivityView.show(on: view)
    }
    
    func hideLoader() {
        ActivityView.hide(on: view)
    }
    
    func reloadData(products: [Product]) {
        self.products = products
        tableView.reloadData()
    }
}

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProductCell
        cell.product = products[indexPath.row]
        return cell
    }
}

