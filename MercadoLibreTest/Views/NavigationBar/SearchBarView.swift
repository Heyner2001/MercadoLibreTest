//
//  SearchBarView.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 16/06/21.
//

import UIKit

protocol SearchTextFieldActions: class {
    func textFieldTap()
}

protocol SearchButtonAction: class {
    func searchButtonAction()
}

class SearchBarView: UIView {
    
    weak var searchTextFieldDelegate: SearchTextFieldActions?
    weak var searchButtonDelegate: SearchButtonAction?
    
    private lazy var searchStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 4
        stackView.addArrangedSubview(searchTextField)
        stackView.addArrangedSubview(searchButton)
        return stackView
    }()
    
    private lazy var searchTextFieldViewActon: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(textFieldTap)))
        return view
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.font = .setFont(.regular, .normal)
        textField.placeholder = stringSources.searchPlaceholder
        return textField
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(named: stringSources.searchImage)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(searchButtonAction), for: .touchUpInside)
        return button
    }()
    
    init(roundedBorders: Bool = true, navBarType: NavBarType) {
        super.init(frame: .zero)
        backgroundColor = .white
        if roundedBorders { layer.cornerRadius = 22 }
        searchTextFieldViewActon.isHidden = !(navBarType == .standard)
        clipsToBounds = true
        addSubview(searchStack)
        addSubview(searchTextFieldViewActon)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        searchStack.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 4))
        }
        searchButton.snp.makeConstraints { $0.width.equalTo(30) }
        searchTextFieldViewActon.snp.makeConstraints { $0.edges.equalTo(searchTextField) }
    }
    
    @objc private func textFieldTap() {
        searchTextFieldDelegate?.textFieldTap()
    }
    
    @objc private func searchButtonAction() {
        searchButtonDelegate?.searchButtonAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
