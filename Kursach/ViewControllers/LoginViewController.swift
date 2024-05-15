//
//  LoginViewController.swift
//  Kursach
//
//  Created by Alexey Dubovik on 12.05.24.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    var loginTextField = UITextField()
    var errorMessage = "" {
        didSet {
            DispatchQueue.main.async {
                showError(for: self, with: self.errorMessage)
            }
        }
    }
    var isLogged = false {
        didSet {
            DispatchQueue.main.async {
                self.warehouseController.modalPresentationStyle = .fullScreen
                self.present(self.warehouseController, animated: true)
            }
        }
    }
    var passwordTextField = UITextField()
    let warehouseController = WarehouseTabBarController()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "SecondaryTintColor")
        let loginTextField = UITextField()
        loginTextField.textColor = .black
        loginTextField.backgroundColor = .white
        loginTextField.attributedPlaceholder = NSAttributedString(
            string: "Логин", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        loginTextField.layer.cornerRadius = 7
        self.loginTextField = loginTextField
        loginTextField.autocorrectionType = .no
        view.addSubview(loginTextField)
        loginTextField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(390)
            make.leading.equalToSuperview().inset(self.view.frame.width/2 - 100)
            make.trailing.equalToSuperview().inset(self.view.frame.width/2 - 100)
            make.height.equalTo(30)
        }
        let passwordTextField = UITextField()
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        passwordTextField.backgroundColor = .white
        passwordTextField.textColor = .black
        passwordTextField.layer.cornerRadius = 7
        passwordTextField.autocorrectionType = .no
        passwordTextField.isSecureTextEntry = true
        self.passwordTextField = passwordTextField
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(435)
            make.leading.equalToSuperview().inset(self.view.frame.width/2 - 100)
            make.trailing.equalToSuperview().inset(self.view.frame.width/2 - 100)
            make.height.equalTo(30)
        }
        let confirmButton = UIButton()
        confirmButton.backgroundColor = .systemBlue
        confirmButton.setTitle("Войти", for: .normal)
        confirmButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        confirmButton.layer.cornerRadius = 7
        view.addSubview(confirmButton)
        confirmButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(480)
            make.leading.equalToSuperview().inset(self.view.frame.width/2 - 60)
            make.trailing.equalToSuperview().inset(self.view.frame.width/2 - 60)
        }
    }
    @objc func login() {
        guard let login = self.loginTextField.text else {
            showError(for: self, with: "Введите логин")
            return
        }
        guard let password = self.passwordTextField.text else {
            showError(for: self, with: "Введите пароль")
            return
        }
        if login == "" {
            showError(for: self, with: "Введите логин")
            return
        }
        if password == "" {
            showError(for: self, with: "Введите пароль")
            return
        }
        let creds = Credentials(login: login, password: password)
        let apiConfig = ApiConfig(scheme: "https",
                                  host: "alexeydubovik.pythonanywhere.com")
        let apiFetcher = ApiFetcher()
        let api = API(apiConfig: apiConfig, apiFetcher: apiFetcher)
        let loadingAlert = createLoadingAlert()
        present(loadingAlert, animated: true, completion: nil)
        api.login(credentials: creds) { result in
            DispatchQueue.main.sync {
                
                switch result {
                case .success(let employee):
                    loadingAlert.dismiss(animated: false, completion: {
                        self.isLogged.toggle()
                    })
                case .failure(let error):
                    loadingAlert.dismiss(animated: false, completion: {
                        self.errorMessage = error.descriprion
                        return
                    })
                    
                }
            }
        }
    }
    func createLoadingAlert() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Загрузка...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()
        alert.view.addSubview(loadingIndicator)
        return alert
    }
}
