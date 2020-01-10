//
//  DashboardJobTVC.swift
//  StepJob
//
//  Created by Sirius on 23.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class DashboardJobTVC: UITableViewCell {

    @IBOutlet weak var jobLabel: UILabel!
    
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var emergencyTag: UILabel!
    @IBOutlet weak var hourlyTag: UILabel!
    @IBOutlet weak var strongTag: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        emergencyTag.layer.cornerRadius = 12.0
        emergencyTag.clipsToBounds = true
        hourlyTag.layer.cornerRadius = 12.0
        hourlyTag.clipsToBounds = true
        strongTag.layer.cornerRadius = 12.0
        strongTag.clipsToBounds = true
        
    }
    
    func fillCell(job: String, company: String, location: String, price: String) {
        jobLabel.text = job
        companyLabel.text = company
        locationLabel.text = location
        priceLabel.text = price
    }
}
