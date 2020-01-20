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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        editButton.layer.cornerRadius = 20
    }
}
