//
//  SearchView.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 18/06/21.
//

import UIKit

class SearchView: UIView {
    
    let navBar = NavigationBarView(type: .search)
    
    init() {
        super.init(frame: .zero)
        addSubview(navBar)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        navBar.snp.makeConstraints { $0.left.right.top.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
