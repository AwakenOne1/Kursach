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
//                guard let context = self.context else { fatalError("No context") }
//                let entity = NSEntityDescription.entity(forEntityName: "Item", in: context)
//                guard let entity = entity else { fatalError("No entity") }
//                let item1 = NSManagedObject(entity: entity,insertInto: context)
//                item1.setValue("Материнские платы", forKey: "title")
//                item1.setValue("MotherBoardImage", forKey: "imageName")
//                let item2 = NSManagedObject(entity: entity,insertInto: context)
//                item2.setValue("Процессоры", forKey: "title")
//                item2.setValue("CpuImage", forKey: "imageName")
//                let item3 = NSManagedObject(entity: entity,insertInto: context)
//                item3.setValue("Видеокарты", forKey: "title")
//                item3.setValue("GpuImage", forKey: "imageName")
//                let item4 = NSManagedObject(entity: entity,insertInto: context)
//                item4.setValue("ОЗУ", forKey: "title")
//                item4.setValue("RamImage", forKey: "imageName")
//                let item5 = NSManagedObject(entity: entity,insertInto: context)
//                item5.setValue("SSD", forKey: "title")
//                item5.setValue("SsdImage", forKey: "imageName")
//                let item6 = NSManagedObject(entity: entity,insertInto: context)
//                item6.setValue("Блоки питания", forKey: "title")
//                item6.setValue("PsuImage", forKey: "imageName")
//                let item7 = NSManagedObject(entity: entity,insertInto: context)
//                item7.setValue("Корпусы", forKey: "title")
//                item7.setValue("CaseImage", forKey: "imageName")
//        
//                do {
//                    try context.save()
//                } catch {
//                    print("oops")
//                }
        
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


