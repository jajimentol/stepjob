
//
//  MoreTVC.swift
//  StepJob
//
//  Created by Sirius on 4.02.2020.
//  Copyright © 2020 Stepjob. All rights reserved.
//

import UIKit

class MoreTVC: UITableViewCell {

    @IBOutlet weak var rowImage: UIImageView!
    @IBOutlet weak var rowLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fillCell(row: Int) {
        switch row {
        case 0:
            rowLabel.text = "Şifreni Yenile"
            if #available(iOS 13.0, *) {
                rowImage.image = UIImage(systemName: "lock")
            } else {
                rowImage.image = UIImage(named: "")
            }
        case 1:
            rowLabel.text = "Bildirimler"
            if #available(iOS 13.0, *) {
                rowImage.image = UIImage(systemName: "bell")
            } else {
                rowImage.image = UIImage(named: "")
            }
        case 2:
            rowLabel.text = "Yardım"
            if #available(iOS 13.0, *) {
                rowImage.image = UIImage(systemName: "questionmark.circle")
            } else {
                rowImage.image = UIImage(named: "")
            }
        case 3:
            rowLabel.text = "Hakkında"
            if #available(iOS 13.0, *) {
                rowImage.image = UIImage(systemName: "info.circle")
            } else {
                rowImage.image = UIImage(named: "")
            }
        case 4:
            rowLabel.text = "Çıkış Yap"
            rowImage.image = UIImage(named: "exit")
        default:
            break
        }
    }
}
