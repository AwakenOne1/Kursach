//
//  ProductCell.swift
//  Kursach
//
//  Created by Alexey Dubovik on 8.05.24.
//

import UIKit
import SnapKit

class ProductCell: UICollectionViewCell {
    let title = UILabel()
    let imageView = UIImageView()
    let shortDescription = UILabel()
    let price = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.bottom.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(self.frame.width*0.6)
        }
        addSubview(title)
        title.font = UIFont.systemFont(ofSize: 20)
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(18)
            make.trailing.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(self.frame.width*0.4 + 10)
        }
        addSubview(shortDescription)
        shortDescription.numberOfLines = 6
        shortDescription.textColor = .lightText
        shortDescription.font = UIFont.systemFont(ofSize: 14)
        shortDescription.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(65)
            make.trailing.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(self.frame.width*0.4 + 10)
        }
        addSubview(price)
        price.font = UIFont.boldSystemFont(ofSize: 20)
        price.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(161)
            make.trailing.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(self.frame.width*0.4 + 10)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
