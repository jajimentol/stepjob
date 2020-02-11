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
    
    @IBOutlet weak var companyImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if isUserEmployer! {
            companyImage.layer.cornerRadius = 24.0
            companyImage.clipsToBounds = true
            nameLabel.text = employerUser?.organizationName
            activeAdsLabel.text = String(employerUser?.activeJobCount ?? 0)
            passiveAdsLabel.text = String(employerUser?.passiveJobCount ?? 0)
            if let url = URL(string: employerUser?.profilePicture ?? "") {
                DispatchQueue.global().async {
                        if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            self.companyImage.image = UIImage(data: data)
                        }
                    }
                }
            }
        }
    }

    
}
