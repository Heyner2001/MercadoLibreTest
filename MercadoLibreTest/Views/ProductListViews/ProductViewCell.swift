//
//  ProductViewCell.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 18/06/21.
//

import UIKit
import SnapKit
import Kingfisher

class ProductViewCell: UICollectionViewCell {
    
    private var product: ProductModel? {
        didSet {
            let urlImage = URL(string: product?.image ?? "")
            productImage.kf.setImage(with: urlImage)
            productPrice.text = product?.price.currencyFormat().priceWithFormat(currenciId: product?.currencyId ?? "")
            productName.text = product?.title
        }
    }
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 4
        stackView.addArrangedSubview(productImage)
        stackView.addArrangedSubview(productName)
        stackView.addArrangedSubview(productPrice)
        return stackView
    }()
    
    private let productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private let productName: UILabel = {
        let label = UILabel()
        label.font = .setFont(.regular, .small)
        label.textAlignment = .left
        label.textColor = .lightGray
        label.numberOfLines = 2
        return label
    }()
    
    private let productPrice: UILabel = {
        let label = UILabel()
        label.font = .setFont(.semiBold, .xLarge)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 5
        
        //Bottom shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.2
        
        addSubview(contentStackView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        contentStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 8, bottom: 16, right: 8))
        }
        productImage.snp.makeConstraints { $0.height.equalToSuperview().multipliedBy(0.6) }
    }
    
    func setUpCell(product: ProductModel) {
        self.product = product
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openProductDetail)))
    }
    
    @objc private func openProductDetail() {
        guard let prod = product else { return }
        let productDetailVC = ProductDetailViewController(product: prod, productImage: productImage.image ?? UIImage())
        productDetailVC.modalPresentationStyle = .overFullScreen
        globalNavigationController?.present(productDetailVC, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
