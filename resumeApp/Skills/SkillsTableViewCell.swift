//
//  SkillsTableViewCell.swift
//  resumeApp
//
//  Created by Alexandre  Vassinievski on 26/01/2018.
//  Copyright © 2018 Vassini. All rights reserved.
//

import UIKit
import UICircularProgressRing

class SkillsTableViewCell: UITableViewCell {

  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var progressBar: UICircularProgressRingView!
  
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
