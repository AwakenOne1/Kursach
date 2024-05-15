//
//  Alert.swift
//  Kursach
//
//  Created by Alexey Dubovik on 12.05.24.
//

import Foundation
import UIKit
func showError(for viewController: UIViewController, with message: String) {
    let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
    let okButton = UIAlertAction(title: "Ок", style: .default)
    alertController.addAction(okButton)
    viewController.present(alertController, animated: true)
}
