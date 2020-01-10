//
//  AdPreviewViewController.swift
//  StepJob
//
//  Created by Sirius on 9.12.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class AdPreviewViewController: AdViewController {
    
    var previewView = AdPreviewView()
    
    var readyLabel = standardLabel(text: "İlan Yayınlanmaya Hazır!", size: 20.0, color: UIColorFromRGB(0xF83A53))
    
    var backButton = curvedButton(text: "GERİ", color: .clear, titleColor: .lightGray, font: boldFont(size: 18.0))
    var submitButton = curvedButton(text: "İLANI YAYINLA!", color: .white, titleColor: .white, font: boldFont(size: 18.0))
    
    override func viewDidLoad() {
        step = 3
        super.viewDidLoad()
        
        setupPage()
    }
    
    func setupPage() {
        
        previewView.load()
        bottomView.addSubview(previewView)
        previewView.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.right.equalTo(view).offset(-20)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.height.equalTo(275)
        }
        
        readyLabel.numberOfLines = 0
        readyLabel.textAlignment = .center
        bottomView.addSubview(readyLabel)
        readyLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(previewView)
            make.left.right.equalTo(previewView)
            make.top.equalTo(previewView.snp.bottom).offset(20)
        }
        
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        bottomView.addSubview(backButton)
        backButton.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel).offset(20)
            make.height.equalTo(44)
            make.width.equalTo(100)
            make.top.equalTo(readyLabel.snp.bottom).offset(20)
        }
        
        submitButton.backgroundColor = UIColorFromRGB(0xF32042)
        submitButton.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        bottomView.addSubview(submitButton)
        submitButton.snp.makeConstraints { (make) in
            make.right.equalTo(previewView).offset(-20)
            make.width.equalTo(200)
            make.height.equalTo(44)
            make.centerY.equalTo(backButton)
        }
    }
    
    @objc func submitTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
}
