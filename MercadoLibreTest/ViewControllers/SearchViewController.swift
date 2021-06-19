//
//  SearchViewController.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 18/06/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let searchView = SearchView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        view.addSubview(searchView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        searchView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
