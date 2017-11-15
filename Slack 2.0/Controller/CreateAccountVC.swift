//
//  CreateAccountVC.swift
//  Slack 2.0
//
//  Created by Alex Wong on 11/14/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    
    @IBAction func dismissCreateAccountVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func chooseAvatar(_ sender: Any) {
    }
    
    @IBAction func generateBackgroundColor(_ sender: Any) {
    }
    
    @IBAction func createAccount(_ sender: Any) {
    }
}
