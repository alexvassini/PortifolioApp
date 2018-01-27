//
//  AchievementTableViewCell.swift
//  resumeApp
//
//  Created by Alexandre  Vassinievski on 25/01/2018.
//  Copyright © 2018 Vassini. All rights reserved.
//

import UIKit

class AchievementTableViewCell: UITableViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
