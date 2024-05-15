//
//  OrderView.swift
//  Kursach
//
//  Created by Alexey Dubovik on 15.05.24.
//

import Foundation
import UIKit
import SnapKit

class OrderView: UIView {
    let stackView: UIStackView = UIStackView()
    let orderLabel: UILabel = UILabel()
    let confirmButton = UIButton()
    override init(frame: CGRect ) {
        super.init(frame: frame)
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 30
        self.backgroundColor = UIColor(named: "SecondaryTintColor")
        self.layer.cornerRadius = 15
        self.addSubview(orderLabel)
        orderLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.leading.equalToSuperview().inset(20)
//            make.bottom.equalToSuperview().inset(40)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class OrderCell: UIView {
    let idLabel = UILabel()
    let nameLabel = UILabel()
    let productSwitch = UISwitch()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        self.backgroundColor = .cyan
        self.layer.cornerRadius = 7
        self.addSubview(idLabel)
        idLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(35)
            make.leading.equalToSuperview().inset(10)
        }
        self.addSubview(productSwitch)
        productSwitch.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.leading.equalTo(250)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
