//
//  CategoryDatailViewController.swift
//  Kursach
//
//  Created by Alexey Dubovik on 8.05.24.
//

import UIKit

class CategoryDatailViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let pageTitle = "Процессоры"
    var products = [Product]()
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...100 {
            let product = Product(name: "Продукт \(i)", price: 1245,
                                  imageName: "CpuImage", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore")
            products.append(product)
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
