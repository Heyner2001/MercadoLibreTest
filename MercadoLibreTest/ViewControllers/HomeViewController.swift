//
//  HomeViewController.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 16/06/21.
//

import UIKit
import RxSwift

var globalNavigationController: UINavigationController?
var homeVC = HomeViewController()
class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .backgroundColor
        
        view.addSubview(homeView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        homeView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
