//
//  ItemListViewController+CoreData.swift
//  Kursach
//
//  Created by Alexey Dubovik on 7.05.24.
//

import UIKit
import CoreData

extension ItemListViewController {
    
    func createContext() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError("Cast Error") }
        context = appDelegate.persistentContainer.viewContext
    }
    
    
    
    func fetchCategories() {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        
        do {
            guard let context = self.context else { fatalError("No context") }
            let items = try context.fetch(fetchRequest)
            self.items = items
            
        } catch  {
            print("Error")
        }
    }
}
