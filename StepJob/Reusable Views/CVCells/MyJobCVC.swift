//
//  MyJobCVC.swift
//  StepJob
//
//  Created by Sirius on 10.02.2020.
//  Copyright © 2020 Stepjob. All rights reserved.
//

import UIKit

protocol MyJobApplicationDelegate: class {
    func cancelApplicationTapped(jobId: Int)
}

class MyJobCVC: UICollectionViewCell {

    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var jobTypeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var resignButton: UIButton!
    
    weak var delegate: MyJobApplicationDelegate?
    
    var jobId: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 1.0
        layer.masksToBounds = false
        layer.cornerRadius = 4.0
        
        priceLabel.layer.cornerRadius = 4.0
        priceLabel.clipsToBounds = true

    }
    
    func fillCell(with job: JobsWithStatus) {
        if let job = job.job {
            if job.employer?.profilePicture != nil && job.employer?.profilePicture != "" {
                if let url = URL(string: job.employer?.profilePicture ?? "") {
                    DispatchQueue.global().async {
                            if let data = try? Data(contentsOf: url) {
                            DispatchQueue.main.async {
                                self.companyImage.image = UIImage(data: data)
                            }
                        }
                    }
                }
            }
            jobId = job.id
            companyLabel.text = job.employer?.organizationName
            jobLabel.text = job.title
            jobTypeLabel.text = job.jobType
            locationLabel.text = job.location
            priceLabel.text = (job.jobType ?? "") + " / " + (job.price ?? "")
        }
        if job.status == "APPROVED" {
            resignButton.isHidden = true
        } else if job.status == "WAITING" {
            resignButton.isHidden = false
        }
            
        
    }

    @IBAction func resignTapped(_ sender: Any) {
        delegate?.cancelApplicationTapped(jobId: self.jobId ?? 0)
    }
}
