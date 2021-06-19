//
//  ProductListViewController.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 18/06/21.
//

import UIKit

class ProductListViewController: UIViewController {
    
    var productListView: ProductListView?
    
    init(viewTitle: String) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .backgroundColor
        productListView = ProductListView(viewTitle: viewTitle)
        view.addSubview(productListView ?? UIView())
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        productListView?.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
