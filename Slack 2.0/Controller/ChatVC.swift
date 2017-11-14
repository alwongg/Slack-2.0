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

        // Add function to menuButton outlet
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
    }


}
