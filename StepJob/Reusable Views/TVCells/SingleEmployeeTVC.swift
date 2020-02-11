//
//  SingleEmployeeTVC.swift
//  StepJob
//
//  Created by Sirius on 5.11.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class SingleEmployeeTVC: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        userImage.layer.cornerRadius = 24.0
        userImage.clipsToBounds = true
    }

    func setupForMessageCell() {
        rightLabel.isHidden = true
        nameLabel.text = "Adil Şişman"
        descriptionLabel.text = "Selam, ne zaman işe başlarım?"
    }
    
    func fillCell(with worker: Worker) {
        
        if let url = URL(string: worker.profilePicture ?? "") {
            DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.userImage.image = UIImage(data: data)
                    }
                }
            }
        }
        
        nameLabel.text = worker.fullName
        descriptionLabel.text = worker.location
        rightLabel.text = String(worker.jobCount ?? 0) + " Görevler"
        
    }
    
}
