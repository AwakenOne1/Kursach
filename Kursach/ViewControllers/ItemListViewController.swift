//
//  ViewController.swift
//  Kursach
//
//  Created by Alexey Dubovik on 30.04.24.
//

import UIKit
import SnapKit

class ItemListViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var items: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...100 {
            let item = Item(title: "Item\(i)", imageName: "ItemImage")
            items.append(item)
        }
        self.navigationItem.title = "Товары"
        navigationController?.navigationBar.prefersLargeTitles = true
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: "ItemCell")
        
    }
    
    
}


