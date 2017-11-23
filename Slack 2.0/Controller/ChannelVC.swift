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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImage: CircleImage!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
    }
    
    // Notification Function
    
    @objc func userDataDidChange(_ notif: Notification){
        if AuthService.instance.isLoggedIn{
            loginButton.setTitle(UserDataService.instance.name, for: .normal)
            profileImage.image = UIImage(named: UserDataService.instance.avatarName)
            profileImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        } else {
            loginButton.setTitle("Login", for: .normal)
            profileImage.image = UIImage(named: "menuProfileIcon")
            profileImage.backgroundColor = UIColor.clear
        }
    }
    
    // MARK: - Unwind Segue
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    // MARK: - Actions
    
    @IBAction func loginUser(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }

    @IBAction func addChannel(_ sender: Any) {

    }
    
    
    
}
