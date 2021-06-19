//
//  ProductDetailViewController.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 19/06/21.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    let productDetailView: ProductDetailView
    let fakeBlurEffect: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.4
        return view
    }()
    
    init(product: ProductModel, productImage: UIImage) {
        self.productDetailView = ProductDetailView(product: product, productImage: productImage)
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .clear
        view.addSubview(fakeBlurEffect)
        view.sendSubviewToBack(fakeBlurEffect)
        view.addSubview(productDetailView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        fakeBlurEffect.snp.makeConstraints { $0.edges.equalToSuperview() }
        productDetailView.snp.makeConstraints {
            $0.top.equalTo(UIApplication.navBarHeight)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width * 0.87)
            $0.height.equalTo(UIScreen.main.bounds.height * 0.6)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductDetailViewController: UIPageViewControllerDelegate {
    
}
