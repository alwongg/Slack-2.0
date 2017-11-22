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
    
    // MARK: - Properties
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Update UI
    
    // MARK: - Actions
    
    @IBAction func dismissCreateAccountVC(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func chooseAvatar(_ sender: Any) {
        
    }
    
    @IBAction func generateBackgroundColor(_ sender: Any) {
        
    }
    
    @IBAction func createAccount(_ sender: Any) {
        
        guard let email = emailTextField.text, emailTextField.text != "" else {return}
        guard let password = passwordTextField.text, passwordTextField.text != "" else {return}
        
        AuthService.instance.registerUser(email: email , password: password) { (success) in
            if success{
                AuthService.instance.loginUser(email: email, password: password, completion: { (sucess) in
                    if success {
                        print("LOGGED IN USER!!!", AuthService.instance.authToken)
                    } else {
                        print("not successful")
                    }
                })
            }
        }
        
    }
    
    // MARK: - Display Error Alert
    
    func displayAlert(title: String, message: String){
        
        // create alert controller with a title and message as its parameters
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // only allow user to tap OK
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        // present the controller when displayAlert method is called
        self.present(alertController, animated: true, completion: nil)
        
    }
}
