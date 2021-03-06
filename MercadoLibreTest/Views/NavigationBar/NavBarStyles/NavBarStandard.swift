//
//  NavBarStandard.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 16/06/21.
//

import UIKit

class NavBarStandard: UIView {
    
    private let searchBar = SearchBarView(navBarType: .standard)
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.addArrangedSubview(leftImage)
        stackView.addArrangedSubview(searchBar)
        return stackView
    }()
    
    private lazy var leftImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: stringSources.logoImage)
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .clear
        searchBar.searchButtonDelegate = self
        searchBar.searchTextFieldDelegate = self
        searchBar.searchTextField.delegate = self
        addSubview(contentStackView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        contentStackView.snp.makeConstraints { $0.edges.equalToSuperview() }
        leftImage.snp.makeConstraints { $0.width.equalTo(50) }
    }
    
    private func openSearch() {
        let searchVC = SearchViewController()
        globalNavigationController?.pushViewController(searchVC, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NavBarStandard: SearchTextFieldActions, SearchButtonAction {
    func textFieldTap() { openSearch() }
    func searchButtonAction() { openSearch() }
}

extension NavBarStandard: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}
