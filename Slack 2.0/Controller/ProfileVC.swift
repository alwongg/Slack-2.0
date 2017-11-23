//
//  ProfileVC.swift
//  Slack 2.0
//
//  Created by Alex Wong on 11/22/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var profileImage: UIImageView!
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
        profileImage.image = UIImage(named: UserDataService.instance.avatarName)
        profileImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap))
        backgroundView.addGestureRecognizer(tap)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Actions

    @IBAction func logoutUser(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dismissProfileVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
