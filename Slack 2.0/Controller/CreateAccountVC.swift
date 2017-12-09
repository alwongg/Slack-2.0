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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // MARK: - Properties
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var backgroundColor : UIColor?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            profileImageView.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && backgroundColor == nil {
                profileImageView.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    // MARK: - Update UI
    
    func setupView(){
        
        spinner.isHidden = true
        
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor : PURPLE_TEXT_PLACEHOLDER])
        
        emailTextField.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor : PURPLE_TEXT_PLACEHOLDER])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor : PURPLE_TEXT_PLACEHOLDER])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(){
        view.endEditing(true)
    }
    
    // MARK: - Actions
    
    @IBAction func dismissCreateAccountVC(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func chooseAvatar(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func generateBackgroundColor(_ sender: Any) {
        
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColor = "[\(r), \(g), \(b), 1]"
        
        //animate
        UIView.animate(withDuration: 0.2){
            self.profileImageView.backgroundColor = self.backgroundColor
        }
    }
    
    @IBAction func createAccount(_ sender: Any) {
        
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let name = usernameTextField.text, usernameTextField.text != "" else {return}
        guard let email = emailTextField.text, emailTextField.text != "" else {return}
        guard let password = passwordTextField.text, passwordTextField.text != "" else {return}
        
        AuthService.instance.registerUser(email: email , password: password) { (success) in
            if success{
                AuthService.instance.loginUser(email: email, password: password, completion: { (sucess) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                
                                //Notify observers that user has logged in
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            }
                        })
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
