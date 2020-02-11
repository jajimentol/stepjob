//
//  PopularJobCVC.swift
//  StepJob
//
//  Created by Sirius on 10.02.2020.
//  Copyright © 2020 Stepjob. All rights reserved.
//

import UIKit

class PopularJobCVC: UICollectionViewCell {

    @IBOutlet weak var jobImage: UIImageView!
    
    @IBOutlet weak var jobNameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        jobImage.contentMode = .scaleToFill
        
        layer.cornerRadius = 4.0
        jobImage.layer.cornerRadius = 4.0
        jobImage.clipsToBounds = true
    }

    func fillCell(with job: Job) {
        
        if let url = URL(string: job.employer?.profilePicture ?? "") {
            DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.jobImage.image = UIImage(data: data)
                    }
                }
            }
        }
        
        jobNameLabel.text = job.title
        companyLabel.text = job.employer?.organizationName
        locationLabel.text = job.location
        priceLabel.text = "Günlük: " + (job.price ?? "")
        
    }
    
}
