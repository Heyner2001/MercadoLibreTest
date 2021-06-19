//
//  NavBarSimple.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 18/06/21.
//

import UIKit

class NavBarSimple: UIView {
    
    private lazy var contentStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.addArrangedSubview(backButton)
        stackView.addArrangedSubview(titleView)
        return stackView
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(named: stringSources.backImage)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.addSubview(titleLabel)
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(.bold, .large)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    init(viewTitle: String) {
        super.init(frame: .zero)
        backgroundColor = .clear
        titleLabel.text = viewTitle
        addSubview(contentStack)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        contentStack.snp.makeConstraints { $0.edges.equalToSuperview() }
        backButton.snp.makeConstraints { $0.width.equalTo(30) }
        titleLabel.snp.makeConstraints { $0.center.equalTo(contentStack.snp.center) }
    }
    
    @objc private func backButtonAction() {
        globalNavigationController?.popViewController(animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
