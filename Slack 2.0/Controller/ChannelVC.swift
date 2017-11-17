//
//  ChannelVC.swift
//  Slack 2.0
//
//  Created by Alex Wong on 11/13/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var profileImageView: CircleImageView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    @objc func userDataDidChange(_ notif: Notification){
        
        if AuthService.instance.isLoggedIn{
            loginButton.setTitle(UserDataService.instance.name, for: .normal)
            profileImageView.image = UIImage(named: UserDataService.instance.avatarName)
            profileImageView.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        } else {
            loginButton.setTitle("Login", for: .normal)
            profileImageView.image = UIImage(named: "menuProfileIcon")
            profileImageView.backgroundColor = UIColor.clear
        }
        
    }
    
    // MARK: - Actions

    @IBAction func loginUser(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    //unwind segue (CreateAccountVC dismiss to ChannelVC)
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        
    }
}
