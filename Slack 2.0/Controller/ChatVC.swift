//
//  ChatVC.swift
//  Slack 2.0
//
//  Created by Alex Wong on 11/13/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add toggle panel function to menuButton
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        //allow pan gesture to toggle panel
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        //allow tap to dismiss panel function
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_notif:)), name: NOTIF_CHANNELS_SELECTED, object: nil)
        
        if AuthService.instance.isLoggedIn{
            AuthService.instance.findUserByEmail(completion: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            })
        }
    }
    
    @objc func channelSelected(_notif: Notification){
        updateWithChannel()
    }
    
    func updateWithChannel(){
        let channelName = MessageService.instance.selectedChannel?.channelTitle ?? ""
        channelNameLabel.text = "#\(channelName)"
        getMessages()
    }
    
    @objc func userDataDidChange(_ notif: Notification){
        if AuthService.instance.isLoggedIn {
            // get channels
            onLoginGetMessages()
        } else {
            channelNameLabel.text = "Please Log In"
        }
        
    }
    
    func onLoginGetMessages(){
        MessageService.instance.findAllChannels { (success) in
            if success{
                //do stuff with channels
                if MessageService.instance.channels.count > 0 {
                    MessageService.instance.selectedChannel = MessageService.instance.channels[0]
                    self.updateWithChannel()
                } else {
                    self.channelNameLabel.text = "No channels yet!"
                }
            }
        }
    }
    
    func getMessages(){
        guard let channelId = MessageService.instance.selectedChannel?.id else {return}
        MessageService.instance.findAllMessagesForChannel(channelId: channelId) { (success) in
           
        }
    }
    
    // MARK: - Actions
    
    @IBAction func sendMessage(_ sender: Any) {
    }
    
}











