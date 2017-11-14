//
//  GradientView.swift
//  Slack 2.0
//
//  Created by Alex Wong on 11/14/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

@IBDesignable // Real time action - work in storyboard
class GradientView: UIView {

    @IBInspectable var topColor: UIColor = UIColor.blue{
        didSet{
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = UIColor.green{
        didSet{
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        //set colors
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        //start and end points
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        //size of view
        gradientLayer.frame = self.bounds
        //add gradientLayer to UIView layers
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
