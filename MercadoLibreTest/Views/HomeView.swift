//
//  HomeView.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 16/06/21.
//

import UIKit

class HomeView: UIView {
    
    let navBar = NavigationBarView(type: .standard)
    
    init() {
        super.init(frame: .zero)
        addSubview(navBar)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        navBar.snp.makeConstraints { $0.right.left.top.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
