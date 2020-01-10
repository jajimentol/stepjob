//
//  SingleEmployeeTVC.swift
//  StepJob
//
//  Created by Sirius on 5.11.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class SingleEmployeeTVC: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var rightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func setupForMessageCell() {
        rightLabel.isHidden = true
        nameLabel.text = "Adil Şişman"
        descriptionLabel.text = "Selam, ne zaman işe başlarım?"
    }
    
}
