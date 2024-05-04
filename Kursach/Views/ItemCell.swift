//
//  ItemCell.swift
//  Kursach
//
//  Created by Alexey Dubovik on 3.05.24.
//

import UIKit

class ItemCell: UICollectionViewCell {
    let itemImageView = UIImageView()
    let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(itemImageView)
        addSubview(title)
        itemImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(7)
            make.bottom.equalToSuperview().inset(30)
        }
        title.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(7)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
