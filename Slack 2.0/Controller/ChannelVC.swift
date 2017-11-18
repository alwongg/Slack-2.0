//
//  ChannelVC.swift
//  Slack 2.0
//
//  Created by Alex Wong on 11/13/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Outlets
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var profileImageView: CircleImageView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUserInfo()
    }
    
    func setupUserInfo(){
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
    
    @objc func userDataDidChange(_ notif: Notification){
       setupUserInfo()
    }
    
    // MARK: - Actions

    @IBAction func loginUser(_ sender: Any) {
        if AuthService.instance.isLoggedIn{
            let profileVC = ProfileVC()
            profileVC.modalPresentationStyle = .custom
            present(profileVC, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    //unwind segue (CreateAccountVC dismiss to ChannelVC)
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        
    }
    
    // MARK: - Table View Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelCell", for: indexPath) as? ChannelCell{
            let channel = MessageService.instance.channels[indexPath.row]
            cell.configureCell(channel: channel)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
