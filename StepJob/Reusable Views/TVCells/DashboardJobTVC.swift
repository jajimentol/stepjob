//
//  DashboardJobTVC.swift
//  StepJob
//
//  Created by Sirius on 23.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class DashboardJobTVC: UITableViewCell {
    
    @IBOutlet weak var jobImage: UIImageView!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var jobTypeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
    }
    
    func fillCell(with job: Job) {
        
        let url = URL(string: job.employer?.profilePicture ?? "")
        DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url!) {
                DispatchQueue.main.async {
                    self.jobImage.image = UIImage(data: data)
                }
            }
        }
        
        jobLabel.text = job.title
        companyLabel.text = job.employer?.organizationName
        locationLabel.text = job.location
        jobTypeLabel.text = job.jobType
        if job.jobType == "Dönemsel" {
            priceLabel.text = "İşin tamamı: " + (job.price ?? "")
        } else {
            priceLabel.text = "Günlük: " + (job.price ?? "")
        }
        
    }
}
