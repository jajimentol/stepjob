//
//  EmployerDashboardTVC.swift
//  StepJob
//
//  Created by Sirius on 31.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class EmployerDashboardTVC: UITableViewCell {

    @IBOutlet weak var jobNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var jobTypeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var rightButton: UIButton!
    
    func fillCell(with job: Job) {
        
        selectionStyle = .none
        jobNameLabel.text = job.title
        locationLabel.text = job.location
        jobTypeLabel.text = job.jobType
        timeLabel.text = job.creationDate
        rightButton.layer.borderWidth = 1.0
        rightButton.layer.cornerRadius = 10.0
        rightButton.setTitleColor(.darkGray, for: .normal)
        
        if job.jobApplyCount ?? 0 > 0 {
            let applies = String(job.jobApplyCount ?? 0) + " başvuru"
            rightButton.setTitle(applies, for: .normal)
            rightButton.layer.borderColor = UIColor.cyan.cgColor
            if #available(iOS 13.0, *) {
                rightButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
            } else {
            }
            rightButton.tintColor = UIColor.cyan
        } else {
            rightButton.setTitle("Başvuru yok", for: .normal)
            rightButton.setImage(nil, for: .normal)
            rightButton.layer.borderColor = UIColor.lightGray.cgColor
            rightButton.tintColor = UIColor.lightGray
        }
        
    }
}
