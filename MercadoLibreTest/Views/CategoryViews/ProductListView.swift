//
//  ProductListView.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 18/06/21.
//

import UIKit
import SnapKit

class ProductListView: UIView {
    
    private var navBar: NavigationBarView?
    
    lazy var productCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .backgroundColor
        collection.showsVerticalScrollIndicator = false
        collection.layer.cornerRadius = 5
        collection.clipsToBounds = true
        collection.register(ProductViewCell.self,
                            forCellWithReuseIdentifier: stringSources.productCellKey)
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    init(viewTitle: String) {
        super.init(frame: .zero)
        navBar = NavigationBarView(type: .simple, viewTitle: viewTitle)
        addSubview(navBar ?? UIView())
        addSubview(productCollectionView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        navBar?.snp.makeConstraints { $0.left.right.top.equalToSuperview() }
        guard let navigationBar = navBar else { return }
        productCollectionView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.top.equalTo(navigationBar.snp.bottom).offset(20)
            $0.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductListView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: stringSources.productCellKey, for: indexPath) as? ProductViewCell else {
            return UICollectionViewCell() }
        guard let product = products?[indexPath.row] else { return cell }
        cell.setUpCell(product: product)
        return cell
    }
}

extension ProductListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: productCollectionView.frame.size.width * 0.48, height: 220)
    }
}
