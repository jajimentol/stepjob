//
//  EmployerDashboardTVC.swift
//  StepJob
//
//  Created by Sirius on 31.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class EmployerDashboardTVC: UITableViewCell {

    @IBOutlet weak var adLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var approvedLabel: UILabel!
    @IBOutlet weak var applicationLabel: UILabel!
    @IBOutlet weak var seenLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func fillAd(with job: Job) {
        adLabel.text = job.title
        locationLabel.text = job.location
        approvedLabel.text = String(job.jobApplyCount ?? 0) + " Onaylanan"
        applicationLabel.text = String(job.waitingJobApplies?.count ?? 0) + " Başvuru"
        timeLabel.text = job.creationDate
        typeLabel.text = job.jobType
        
    }
}
