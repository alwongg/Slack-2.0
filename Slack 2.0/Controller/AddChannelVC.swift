//
//  AddChannelVC.swift
//  Slack 2.0
//
//  Created by Alex Wong on 11/18/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Update UI
    
    func setupView(){
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        backgroundView.addGestureRecognizer(closeTouch)
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor : slackPurplePlaceholder])
        descriptionTextField.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedStringKey.foregroundColor : slackPurplePlaceholder])
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Actions

    @IBAction func dismissAddChannelVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createChannel(_ sender: Any) {
        guard let channelName = nameTextField.text, nameTextField.text != "" else {return}
        guard let channelDescription = descriptionTextField.text, descriptionTextField.text != "" else {return}
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDescription) { (success) in
            if success{
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
