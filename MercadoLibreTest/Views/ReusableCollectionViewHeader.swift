//
//  ReusableCollectionViewHeader.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 17/06/21.
//

import UIKit

class ReusableCollectionViewHeader: UICollectionReusableView {
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(.bold, .xxLarge)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerLabel)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        headerLabel.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    func setHeaderTitle(title: String) {
        headerLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
