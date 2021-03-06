//
//  CategoryCellView.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 17/06/21.
//

import UIKit

class CategoryCellView: UITableViewCell {
    
    private var categoryId: String = ""
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.addSubview(contentStackView)
        return view
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 4
        stackView.addArrangedSubview(categoryNameLabel)
        stackView.addArrangedSubview(arrowImageView)
        return stackView
    }()
    
    private let categoryNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.font = .setFont(.regular, .normal)
        label.textColor = .black
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        guard let image = UIImage(named: stringSources.simpleArrow) else { return imageView }
        imageView.image = UIImage(cgImage: image.cgImage!, scale: 1, orientation: .leftMirrored)
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.addSubview(containerView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        containerView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalToSuperview().offset(1)
            $0.bottom.equalToSuperview().offset(-1)
        }
        
        contentStackView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(15)
            $0.centerY.equalToSuperview()
        }
        arrowImageView.snp.makeConstraints { $0.width.equalTo(10) }
    }
    
    func setUpCell(category: CategoryModel) {
        categoryNameLabel.text = category.name
        categoryId = category.id
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
