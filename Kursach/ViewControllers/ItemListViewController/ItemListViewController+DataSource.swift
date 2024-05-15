//
//  ItemListViewController+DataSource.swift
//  Kursach
//
//  Created by Alexey Dubovik on 3.05.24.
//

import UIKit

extension ItemListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        fetchCategories()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ItemCell
        guard let cell = cell else { fatalError("Cast error")}
        let item = items[indexPath.row]
        cell.itemImageView.image = UIImage(named: item.imageName)
        cell.title.text = item.title
        cell.backgroundColor = UIColor(named: "PrimaryTintColor")
        cell.layer.cornerRadius = 11
        return cell
    }
}
