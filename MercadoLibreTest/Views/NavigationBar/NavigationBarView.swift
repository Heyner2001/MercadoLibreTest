//
//  NavigationBarView.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 16/06/21.
//

import UIKit
import SnapKit

class NavigationBarView: UIView {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .mainYellow
        
        addSubview(containerView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        snp.makeConstraints {
            $0.height.equalTo(UIApplication.navBarHeight)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
        
        containerView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.top.equalToSuperview().offset(UIApplication.statusBarHeight + 8 )
            $0.bottom.equalToSuperview().offset(-8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
