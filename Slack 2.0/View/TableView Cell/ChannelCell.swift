//
//  ChannelCell.swift
//  Slack 2.0
//
//  Created by Alex Wong on 11/24/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var channelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2) as! CGColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configureCell(channel : Channel){
        let title = channel.channelTitle ?? ""
        channelName.text = "#\(title)"
    }

}
