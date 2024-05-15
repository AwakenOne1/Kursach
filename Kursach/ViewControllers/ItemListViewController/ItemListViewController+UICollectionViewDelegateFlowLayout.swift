//
//  ItemListViewController+UICollectionViewDelegateFlowLayout.swift
//  Kursach
//
//  Created by Alexey Dubovik on 3.05.24.
//

import UIKit

extension ItemListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2 - 20, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = CategoryDatailViewController()
        viewController.categoryID = indexPath.row
        guard let cell = collectionView.cellForItem(at: indexPath) as? ItemCell else { return }
        viewController.pageTitle = cell.title.text ?? "Unknown Page"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
