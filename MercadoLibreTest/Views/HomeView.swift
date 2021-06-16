//
//  HomeView.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 16/06/21.
//

import UIKit

class HomeView: UIView {
    
    let navBar = NavigationBarView()
    
    init() {
        super.init(frame: .zero)
        addSubview(navBar)
    }
    
    private func setUpConstraints() {
        navBar.snp.makeConstraints { $0.top.left.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
