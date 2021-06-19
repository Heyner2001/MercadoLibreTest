//
//  HomeView.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 16/06/21.
//

import UIKit
import RxSwift

class HomeView: UIView {
    
    let navBar = NavigationBarView(type: .standard)
    
    lazy var categoriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 60
        tableView.bounces = true
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = true
        tableView.alwaysBounceVertical = true
        tableView.showsVerticalScrollIndicator = false
        tableView.bounces = false
        tableView.layer.cornerRadius = 5
        tableView.clipsToBounds = true
        tableView.register(CategoryCellView.self, forCellReuseIdentifier: stringSources.categoriesCellKey)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        addSubview(navBar)
        addSubview(categoriesTableView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        navBar.snp.makeConstraints { $0.right.left.top.equalToSuperview() }
        categoriesTableView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.top.equalTo(navBar.snp.bottom).offset(20)
            $0.bottom.equalToSuperview().offset(-UIApplication.bottomSafeInset)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryData?.categories.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = categoriesTableView.dequeueReusableCell(withIdentifier: stringSources.categoriesCellKey, for: indexPath) as? CategoryCellView else {
            return UITableViewCell()
        }
        guard let category = countryData?.categories[indexPath.row] else { return cell }
        cell.setUpCell(category: category)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categoryLogic.requestGetProducts(url: stringSources.getItems(of: countryData?.categories[indexPath.row].id ?? ""))
        let productListVC = ProductListViewController(viewTitle: countryData?.categories[indexPath.row].name ?? "")
        globalNavigationController?.pushViewController(productListVC, animated: true)
        
        countryModelLogic.publishSubject.dispose()
        categoryLogic.productModelLogic.publishSubject
            .subscribe(on: MainScheduler.instance)
            .subscribe(onNext: { _ in
                DispatchQueue.main.async {
                    productListVC.productListView?.productCollectionView.reloadData()
                }
            })
            .disposed(by: networkManager.disposeBag)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ReusableViewHeader()
        header.setHeaderTitle(title: stringSources.categoriesTitle)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}
