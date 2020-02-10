//
//  MyJobCVC.swift
//  StepJob
//
//  Created by Sirius on 10.02.2020.
//  Copyright © 2020 Stepjob. All rights reserved.
//

import UIKit

class MyJobCVC: UICollectionViewCell {

    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var jobTypeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var resignButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fillCell(with job: Job) {
        
        let url = URL(string: job.employer?.profilePicture ?? "")
        DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url!) {
                DispatchQueue.main.async {
                    self.companyImage.image = UIImage(data: data)
                }
            }
        }
        
        companyLabel.text = job.employer?.organizationName
        jobLabel.text = job.title
        jobTypeLabel.text = job.jobType
        locationLabel.text = job.location
        priceLabel.text = (job.jobType ?? "") + " / " + (job.price ?? "")
        
        if job.status == "APPROVED" {
            resignButton.isHidden = true
        }
        
    }

}
