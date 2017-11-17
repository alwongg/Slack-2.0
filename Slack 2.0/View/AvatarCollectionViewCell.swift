//
//  AvatarCollectionViewCell.swift
//  Slack 2.0
//
//  Created by Alex Wong on 11/16/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class AvatarCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView(){
        
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
    }
    
}
