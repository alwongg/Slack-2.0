//
//  ProfileVC.swift
//  Slack 2.0
//
//  Created by Alex Wong on 11/17/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Update UI

    func setupView(){
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        profileImageView.image = UIImage(named: UserDataService.instance.avatarName)
        profileImageView.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
    }
    
    // MARK: - Actions
    
    @IBAction func dismissProfileVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutUser(_ sender: Any) {
    }
}
