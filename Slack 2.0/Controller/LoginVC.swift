//
//  LoginVC.swift
//  Slack 2.0
//
//  Created by Alex Wong on 11/14/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
    }
    
    // MARK: - Update UI
    
    func setupView(){
        
        spinner.isHidden = true
        
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor:slackPurplePlaceholder])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor:slackPurplePlaceholder])
    }

    // MARK: - Actions
    
    @IBAction func dismissLoginVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccount(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    @IBAction func loginUser(_ sender: Any) {
        
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let email = usernameTextField.text, usernameTextField.text != "" else {return}
        guard let password = passwordTextField.text, passwordTextField.text != "" else {return}
        
        AuthService.instance.loginUser(email: email, password: password) { (success) in
            if success{
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success{
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    @IBAction func signupUser(_ sender: Any) {
        
    }
}
