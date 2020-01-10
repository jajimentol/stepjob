//
//  SingleLabelCVC.swift
//  StepJob
//
//  Created by Sirius on 9.12.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class SingleLabelCVC: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var isActive: Bool = false {
        willSet {
            if newValue {
                layer.borderColor = UIColorFromRGB(0xF32042).cgColor
            } else {
                layer.borderColor = UIColor.lightGray.cgColor
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        layer.cornerRadius = 8.0
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 2.0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        addGestureRecognizer(tap)
    }
    
    func setup(day: Int) {
        switch day {
        case 0:
            titleLabel.text = "Pazartesi"
        case 1:
            titleLabel.text = "Salı"
        case 2:
            titleLabel.text = "Çarşamba"
        case 3:
            titleLabel.text = "Perşembe"
        case 4:
            titleLabel.text = "Cuma"
        case 5:
            titleLabel.text = "Cumartesi"
        case 6:
            titleLabel.text = "Pazar"
        default:
            titleLabel.text = ""
        }
    }
    
    @objc func cellTapped() {
        isActive.toggle()
    }
}
