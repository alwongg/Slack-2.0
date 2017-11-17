//
//  CircleImageView.swift
//  Slack 2.0
//
//  Created by Alex Wong on 11/17/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImageView: UIImageView {

    // don't need inspectable because we won't be changing anything in storyboard
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }

}
