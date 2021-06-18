//
//  HomeView.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 16/06/21.
//

import UIKit

class HomeView: UIView {
    
    let navBar = NavigationBarView(type: .standard)
    
    lazy var categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = UIColor.clear
        collection.showsVerticalScrollIndicator = false
        collection.layer.cornerRadius = 5
        collection.clipsToBounds = true
        collection.register(CategoryCellView.self,
                            forCellWithReuseIdentifier: stringSources.categoriesCellKey)
        collection.register(ReusableCollectionViewHeader.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: stringSources.categoriesHeaderKey)
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    init() {
        super.init(frame: .zero)
        addSubview(navBar)
        addSubview(categoriesCollectionView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        navBar.snp.makeConstraints { $0.right.left.top.equalToSuperview() }
        categoriesCollectionView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.top.equalTo(navBar.snp.bottom).offset(20)
            $0.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countryData?.categories.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: stringSources.categoriesCellKey, for: indexPath) as? CategoryCellView else {
            return UICollectionViewCell()
        }
        guard let category = countryData?.categories[indexPath.row] else { return cell }
        cell.setUpCell(category: category)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var view: UICollectionReusableView?
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: stringSources.categoriesHeaderKey, for: indexPath) as? ReusableCollectionViewHeader else { return UICollectionReusableView() }
            headerView.setHeaderTitle(title: stringSources.categoriesTitle)
            view = headerView
        } else { return UICollectionReusableView() }
        return view ?? UICollectionReusableView()
    }
}

extension HomeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: categoriesCollectionView.frame.size.width, height: 57)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return  CGSize(width: categoriesCollectionView.frame.size.width, height: 60)
    }
}
