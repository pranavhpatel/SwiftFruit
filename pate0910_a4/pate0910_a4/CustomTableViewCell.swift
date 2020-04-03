//
//  CustomTableViewCell.swift
//  pate0910_a4
//
//  Created by Prism Student on 2020-02-29.
//  Copyright © 2020 Pranav Patel. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell{

    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dislikeLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var fruitLabel: UILabel!
    @IBOutlet weak var fruitImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
