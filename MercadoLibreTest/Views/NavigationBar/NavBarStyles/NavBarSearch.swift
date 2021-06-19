//
//  NavBarSearch.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 16/06/21.
//

import UIKit
import RxSwift

class NavBarSearch: UIView {
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 12
        stackView.addArrangedSubview(backButton)
        stackView.addArrangedSubview(searchBar)
        return stackView
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(named: stringSources.backImage), for: .normal)
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return button
    }()
    
    private let searchBar = SearchBarView(navBarType: .search)
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .clear
        searchBar.searchTextFieldDelegate = self
        searchBar.searchButtonDelegate = self
        searchBar.searchTextField.becomeFirstResponder()
        addSubview(containerStackView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        containerStackView.snp.makeConstraints { $0.edges.equalToSuperview() }
        backButton.snp.makeConstraints { $0.width.equalTo(30) }
    }
    
    @objc private func backAction() {
        globalNavigationController?.popViewController(animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NavBarSearch: SearchTextFieldActions, SearchButtonAction {
    func searchButtonAction() {
        categoryLogic.requestGetProducts(url: stringSources.getSearchUrl(search: searchBar.searchTextField.text ?? ""))
        let productListVC = ProductListViewController(viewTitle: searchBar.searchTextField.text ?? "")
        globalNavigationController?.pushViewController(productListVC, animated: true)
        
        categoryLogic.productModelLogic.publishSubject
            .subscribe(on: MainScheduler.instance)
            .subscribe(onNext: { _ in
                DispatchQueue.main.async {
                    productListVC.productListView?.productCollectionView.reloadData()
                }
            })
            .disposed(by: networkManager.disposeBag)
    }
    
    func textFieldTap() {}
}
