//
//  AdViewController.swift
//  StepJob
//
//  Created by Sirius on 9.12.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class AdViewController: PageViewController {
    
    var bottomView = UIScrollView()
    
    var contentSize: CGSize!
    var step: Int!
    
    var topLine = UIImageView()
    var step1 = UIImageView()
    var step2 = UIImageView()
    var step3 = UIImageView()
    
    var titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInterface()
    }
    
    func setInterface() {
        view.backgroundColor = UIColorFromRGB(0x433F64)
        bottomView.backgroundColor = .white
        bottomView.layer.cornerRadius = 24.0
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.bottom.equalTo(view).offset(25)
            make.top.equalTo(view).offset(100)
        }
        contentSize = CGSize(width: view.frame.width, height: 650)
        bottomView.contentSize = contentSize
        
        topLine.backgroundColor = UIColorFromRGB(0xF32042)
        view.addSubview(topLine)
        topLine.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(40)
            make.right.equalTo(view).offset(-40)
            make.top.equalTo(view).offset(50)
            make.height.equalTo(3)
        }
        setSteps()
        
        titleLabel.font = boldFont(size: 24.0)
        bottomView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(bottomView).offset(30)
            make.top.equalTo(bottomView).offset(20)
        }
    }
    
    func setSteps() {
        step1.layer.cornerRadius = 15
        step1.layer.borderWidth = 2
        step1.backgroundColor = UIColorFromRGB(0x433F64)
        step1.layer.borderColor = UIColorFromRGB(0xF32042).cgColor
        view.addSubview(step1)
        step1.snp.makeConstraints { (make) in
            make.centerY.equalTo(topLine)
            make.centerX.equalTo(topLine.snp.left)
            make.height.width.equalTo(30)
        }
        
        step2.layer.cornerRadius = 15
        step2.layer.borderWidth = 2
        step2.backgroundColor = UIColorFromRGB(0x433F64)
        step2.layer.borderColor = UIColorFromRGB(0xF32042).cgColor
        view.addSubview(step2)
        step2.snp.makeConstraints { (make) in
            make.centerY.equalTo(topLine)
            make.centerX.equalTo(topLine)
            make.height.width.equalTo(30)
        }
        
        step3.layer.cornerRadius = 15
        step3.layer.borderWidth = 2
        step3.backgroundColor = UIColorFromRGB(0x433F64)
        step3.layer.borderColor = UIColorFromRGB(0xF32042).cgColor
        view.addSubview(step3)
        step3.snp.makeConstraints { (make) in
            make.centerY.equalTo(topLine)
            make.centerX.equalTo(topLine.snp.right)
            make.height.width.equalTo(30)
        }
        
        switch step {
        case 1:
            step1.image = UIImage(named: "okey")
            titleLabel.text = "İş Tanımı"
        case 2:
            step1.image = UIImage(named: "okey")
            step2.image = UIImage(named: "okey")
            titleLabel.text = "Zaman - Konum"
        case 3:
            step1.image = UIImage(named: "okey")
            step2.image = UIImage(named: "okey")
            step3.image = UIImage(named: "okey")
            titleLabel.text = "İlan Önizleme"
        default:
            step1.image = UIImage(named: "okey")
        }
    }
}
