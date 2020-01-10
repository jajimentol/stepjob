//
//  OtherMessageTVC.swift
//  StepJob
//
//  Created by Sirius on 1.12.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class OtherMessageTVC: UITableViewCell {

    @IBOutlet weak var bubbleView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bubbleView.layer.cornerRadius = 16.0
    }
}
