//
//  CategoryViewController.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 18/06/21.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var categoryView: CategoryView?
    
    init(viewTitle: String) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .backgroundColor
        categoryView = CategoryView(viewTitle: viewTitle)
        view.addSubview(categoryView ?? UIView())
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        categoryView?.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
