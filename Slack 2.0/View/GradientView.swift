//
//  GradientView.swift
//  Slack 2.0
//
//  Created by Alex Wong on 11/20/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

//allow storyboard to render views in xcode
@IBDesignable
class GradientView: UIView {
    
    //allow storyboard to set custom colors
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.3631127477, green: 0.4045833051, blue: 0.8775706887, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        
        //create gradient object
        let gradientLayer = CAGradientLayer()
        
        //set colors found in gradient
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        
        //set start and end points
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        //size of gradient
        gradientLayer.frame = self.bounds
        
        //add to view
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
