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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add toggle panel function to menuButton
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        //allow pan gesture to toggle panel
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        //allow tap to dismiss panel function
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
    }
}
