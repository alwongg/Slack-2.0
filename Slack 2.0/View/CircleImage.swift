//
//  CircleImage.swift
//  Slack 2.0
//
//  Created by Alex Wong on 11/22/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {

    override func awakeFromNib() {
        setupView()
    }
    
    func setupView(){
        //perfect circle
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
