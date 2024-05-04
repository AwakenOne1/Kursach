//
//  WarehouseTabBarController.swift
//  Kursach
//
//  Created by Alexey Dubovik on 1.05.24.
//

import UIKit

class WarehouseTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    
    func configureViewController() {
        let itemsController = ItemListViewController()
        itemsController.tabBarItem = UITabBarItem(title: "Товары", image: UIImage(systemName: "bag.fill"), tag: 0)
        
        let scannerController = ScannerViewController()
        scannerController.tabBarItem = UITabBarItem(title: "Сканер", image: UIImage(systemName:  "camera.viewfinder"), tag: 1)
        
        let currentOrdersController = CurrentOrdersViewController()
        currentOrdersController.tabBarItem = UITabBarItem(title: "Заказы", image: UIImage(systemName: "cart.fill"), tag: 2)
        
        var viewControllers = [itemsController, scannerController, currentOrdersController]
        viewControllers = viewControllers.map {
            return UINavigationController(rootViewController: $0)
        }
        
        self.viewControllers = viewControllers
    }
    
}
