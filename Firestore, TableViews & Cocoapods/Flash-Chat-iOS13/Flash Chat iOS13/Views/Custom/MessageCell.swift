//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Israel Diaz de Leon on 20/03/26.
//  Copyright © 2026 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var bubble: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var meAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bubble.layer.cornerRadius = bubble.frame.size.height / 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
