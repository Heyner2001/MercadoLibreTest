//
//  ProductDetailView.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 19/06/21.
//

import UIKit
import SnapKit

class ProductDetailView: UIView {
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(named: stringSources.closeImage)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(closeDetail), for: .touchUpInside)
        return button
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.addArrangedSubview(soldQuantityLabel)
        stackView.addArrangedSubview(productImageView)
        stackView.addArrangedSubview(productNameLabel)
        stackView.addArrangedSubview(productPriceLabel)
        stackView.addArrangedSubview(productConditionLabel)
        return stackView
    }()
    
    private let soldQuantityLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(.medium, .small)
        label.textColor = .lightGray
        label.textAlignment = .left
        return label
    }()
    
    private let productImageView = UIImageView()
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(.regular, .xxLarge)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(.semiBold, .huge)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let productConditionLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(.regular, .normal)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    init(product: ProductModel, productImage: UIImage) {
        super.init(frame: .zero)
        backgroundColor = .white
        layer.cornerRadius = 8
        
        soldQuantityLabel.text = stringSources.soldQuantityText(quantity: product.soldQuantity)
        productNameLabel.text = product.title
        productImageView.image = productImage
        productPriceLabel.text = product.price.currencyFormat().priceWithFormat(currenciId: product.currencyId)
        productConditionLabel.text = stringSources.conditionString + product.condition
        addSubview(closeButton)
        addSubview(contentStackView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.left.equalToSuperview().offset(16)
            $0.height.width.equalTo(30)
        }
        
        contentStackView.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp.bottom).offset(12)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.bottom.lessThanOrEqualToSuperview().offset(-16)
        }
        
        productImageView.snp.makeConstraints {
            $0.height.equalTo(self.snp.height).multipliedBy(0.4)
        }
    }
    
    @objc private func closeDetail() {
        globalNavigationController?.dismiss(animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
