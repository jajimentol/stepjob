//
//  ProfileHeaderTVC.swift
//  StepJob
//
//  Created by Sirius on 17.12.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class ProfileHeaderTVC: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var activeAdsLabel: UILabel!
    @IBOutlet weak var passiveAdsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if isUserEmployer! {
            nameLabel.text = employerUser?.organizationName
            activeAdsLabel.text = String(employerUser?.activeJobCount ?? 0)
            passiveAdsLabel.text = String(employerUser?.passiveJobCount ?? 0)
        }
    }

    
}
