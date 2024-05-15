//
//  CurrentOrdersViewController.swift
//  Kursach
//
//  Created by Alexey Dubovik on 3.05.24.
//

import UIKit
import SnapKit

class CurrentOrdersViewController: UIViewController {
    var isNoOrders = true
    let orderView = OrderView(frame: .zero)
    var order: Order? {
        didSet {
            DispatchQueue.main.async {
                guard let order = self.order else { fatalError("sd")}
                self.orderView.orderLabel.text = "Заказ \(order.orderID)"
                for product in order.products {
                    let cell = OrderCell(frame: .zero)
                    cell.idLabel.text = "Номер \(product.id)"
                    cell.nameLabel.text = "\(product.name)"
                    self.orderView.stackView.addArrangedSubview(cell)
                }
                self.orderView.isHidden = false
            }
        }
    }
    override func viewDidLoad() {
        self.navigationItem.title = "Заказы"
        navigationController?.navigationBar.prefersLargeTitles = true
        let getOrderButton = UIButton()
        getOrderButton.setTitle("Взять заказ", for: .normal)
        getOrderButton.addTarget(self, action: #selector(getOrder), for: .touchUpInside)
        getOrderButton.backgroundColor = .systemBlue
        getOrderButton.layer.cornerRadius = 7
        view.addSubview(getOrderButton)
        getOrderButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(170)
        }
        view.addSubview(orderView)
        orderView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(270)
            make.leading.trailing.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(120)
        }
        orderView.isHidden = true
    }
    @objc func getOrder() {
        orderView.stackView.removeAllArrangedSubviews()
        let apiConfig = ApiConfig(scheme: "https",
                                  host: "alexeydubovik.pythonanywhere.com")
        let apiFetcher = ApiFetcher()
        let api = API(apiConfig: apiConfig, apiFetcher: apiFetcher)
        DispatchQueue.main.async {
            api.getOrder(userId: 1) { result in
                switch result {
                case .success(let order):
                    print(order.orderID)
                    self.order = order
                case .failure(let error):
                    print(error.descriprion + "s")
                    return
                }
            }
        }
    }
}
