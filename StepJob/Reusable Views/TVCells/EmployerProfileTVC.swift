//
//  EmployerProfileTVC.swift
//  StepJob
//
//  Created by Sirius on 20.01.2020.
//  Copyright © 2020 Stepjob. All rights reserved.
//

import UIKit

class EmployerProfileTVC: UITableViewCell {

    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var adsLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var sectorLabel: UILabel!
    
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        editButton.layer.cornerRadius = 20
    }
    
    func fillEmployer(with employer: Employer) {
        
        companyLabel.text = employer.organizationName
        adsLabel.text = String(employer.activeJobCount ?? 0)
        ratingLabel.text = String(employer.rating ?? 5.0)
        sectorLabel.text = employer.activityArea?.name
        
    }
}
