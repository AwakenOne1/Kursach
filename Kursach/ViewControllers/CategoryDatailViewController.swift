//
//  CategoryDatailViewController.swift
//  Kursach
//
//  Created by Alexey Dubovik on 8.05.24.
//

import UIKit

class CategoryDatailViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var pageTitle = ""
    var products = [Product]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }

        }
    }
    var collectionView: UICollectionView!
    var categoryID: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let apiConfig = ApiConfig(scheme: "https",
                                          host: "alexeydubovik.pythonanywhere.com")
        let apiFetcher = ApiFetcher()
        let api = API(apiConfig: apiConfig, apiFetcher: apiFetcher)
        Task {
            api.getProducts(categoryId: self.categoryID+1) { result in
                switch result {
                case .success(let productsResponse):
                    self.products = productsResponse
                case .failure(let error):
                    showError(for: self, with: error.descriprion)
                }
            }
        }
        self.navigationItem.title = pageTitle
        self.navigationController?.navigationBar.prefersLargeTitles = false
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: "ProductCell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell
        guard let cell = cell else { fatalError("Cast error")}
        let product = products[indexPath.row]
        cell.imageView.image = UIImage(named: product.imageName)
        cell.price.text = "Цена: " + String(product.price)
        cell.shortDescription.text = product.description
        cell.title.text = product.name
        cell.layer.cornerRadius = 11
        cell.backgroundColor = UIColor(named: "SecondaryTintColor")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
}
