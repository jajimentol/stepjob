//
//  OnboardingImageCVC.swift
//  StepJob
//
//  Created by Sirius on 13.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class OnboardingImageCVC: UICollectionViewCell {

    let images = ["worker1","worker2","worker3"]
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setImage(index: Int) {
        imageView.image = UIImage(named: images[index])
    }

}
