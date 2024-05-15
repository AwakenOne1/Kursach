//
//  ScannerViewController.swift
//  Kursach
//
//  Created by Alexey Dubovik on 1.05.24.
//

import UIKit
import SnapKit
import SwiftQRCodeScanner

class ScannerViewController: UIViewController, QRScannerCodeDelegate {
    var scanner: QRCodeScannerController = QRCodeScannerController()
    let label = UILabel()
    
    func qrScanner(_ controller: UIViewController, didScanQRCodeWithResult result: String) {
//        let alertController = UIAlertController(title: "Результат", message: result, preferredStyle: .alert)
//        let okButton = UIAlertAction(title: "Ок", style: .default)
//        alertController.addAction(okButton)
//        self.present(alertController, animated: true)
        label.text = result
    }
    func qrScanner(_ controller: UIViewController, didFailWithError error: SwiftQRCodeScanner.QRCodeError) {
        showError(for: self, with: error.localizedDescription)
    }
    func qrScannerDidCancel(_ controller: UIViewController) {
        print("did cancel")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.scanner = QRCodeScannerController()
        self.scanner.delegate = self
        self.present(scanner, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        self.navigationItem.title = "Сканер"
        
    }
}
