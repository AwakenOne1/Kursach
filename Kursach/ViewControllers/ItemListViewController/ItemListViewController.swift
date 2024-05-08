//
//  ViewController.swift
//  Kursach
//
//  Created by Alexey Dubovik on 30.04.24.
//

import UIKit
import SnapKit
import CoreData

class ItemListViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var items: [Item] = []
    var context: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    override func loadView() {
        super.loadView()
        createContext()
        fetchCategories()
    }
    
}


