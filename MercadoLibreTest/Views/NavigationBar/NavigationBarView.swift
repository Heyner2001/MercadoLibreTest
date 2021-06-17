//
//  NavigationBarView.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 16/06/21.
//

import UIKit
import SnapKit

enum NavBarStyle {
    case standard, search
}

class NavigationBarView: UIView {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private var barStyle: UIView?
    
    init(style: NavBarStyle) {
        super.init(frame: .zero)
        backgroundColor = style == .standard ? .mainYellow : .white
        barStyle = style == .standard ? NavBarStandard() : NavBarSearch()
        
        //Bottom shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.2
        
        addSubview(containerView)
        containerView.addSubview(barStyle ?? UIView())
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
        
        barStyle?.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
