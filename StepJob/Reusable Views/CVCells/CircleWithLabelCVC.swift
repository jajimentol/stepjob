//
//  CircleWithLabelCVC.swift
//  StepJob
//
//  Created by Sirius on 9.01.2020.
//  Copyright © 2020 Stepjob. All rights reserved.
//

import UIKit

class CircleWithLabelCVC: UICollectionViewCell {

    @IBOutlet weak var circleView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        circleView.layer.cornerRadius = 35
        
    }
    
    func fillCell(type: Int) {
        
        switch type {
        case 0:
            circleView.backgroundColor = UIColor.systemRed
            titleLabel.text = "Acil"
        case 1:
            circleView.backgroundColor = UIColor.systemGreen
            titleLabel.text = "En Yeni"
        case 2:
            circleView.backgroundColor = UIColor.systemPurple
            titleLabel.text = "Yakınımda"
        case 3:
            circleView.backgroundColor = UIColor.systemOrange
            titleLabel.text = "Tüm İlanlar"
        case 4:
            circleView.backgroundColor = UIColor.systemBlue
            titleLabel.text = "Popüler"
        default:
            break
        }
        
    }

}
