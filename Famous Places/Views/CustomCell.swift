//
//  CustomCell.swift
//  Famous Places
//
//  Created by Ivaylo Todorov on 31.10.17.
//  Copyright © 2017 Ivaylo Todorov. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var customCellImage: UIImageView!
    @IBOutlet weak var customCellUserImage: UIImageView!
    @IBOutlet weak var customCellUsername: UILabel!
    @IBOutlet weak var customCellPost: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
