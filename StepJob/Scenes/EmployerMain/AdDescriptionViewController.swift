//
//  AdDescriptionViewController.swift
//  StepJob
//
//  Created by Sirius on 9.12.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class AdDescriptionViewController: AdViewController {
    
    var titleField: TextFieldWithTrailerLine!
    var priceField: TextFieldWithTrailerLine!
    var countField: TextFieldWithTrailerLine!
    var equipmentField: TextFieldWithTrailerLine!
    var clothField: TextFieldWithTrailerLine!
    var descriptionField: TextFieldWithTrailerLine!
    
    var backButton = curvedButton(text: "GERİ", color: .clear, titleColor: .lightGray, font: boldFont(size: 18.0))
    var submitButton = curvedButton(text: "DEVAM", color: UIColorFromRGB(0xF32042), titleColor: .white, font: boldFont(size: 18.0))
    
    override func viewDidLoad() {
        step = 1
        super.viewDidLoad()
        
        setupFields()
    }
    
    func setupFields() {
        titleField = TextFieldWithTrailerLine(title: "*İlan başlığı, pozisyon veya iş tanımı",
                                              placeholder: "Bir meslek yazın(Garson, Temizlikçi vb.)")
        bottomView.addSubview(titleField)
        titleField.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(5)
            make.right.equalTo(view).offset(-20)
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.height.equalTo(60)
        }
        
        priceField = TextFieldWithTrailerLine(title: "*Ücret, yevmiye",
                                              placeholder: "0₺")
        bottomView.addSubview(priceField)
        priceField.snp.makeConstraints { (make) in
            make.left.equalTo(titleField)
            make.top.equalTo(titleField.snp.bottom).offset(20)
            make.height.equalTo(60)
            make.right.equalTo(bottomView.snp.centerX)
        }
        
        countField = TextFieldWithTrailerLine(title: "*İşçi Sayısı",
                                              placeholder: "1 Kişi")
        bottomView.addSubview(countField)
        countField.snp.makeConstraints { (make) in
            make.left.equalTo(priceField.snp.right).offset(5)
            make.right.equalTo(titleField)
            make.centerY.height.equalTo(priceField)
        }
        
        equipmentField = TextFieldWithTrailerLine(title: "*Çalışanın iş günü yanında bulundurması gereken ekipmanlar",
                                              placeholder: "Defter, kalem vb.")
        bottomView.addSubview(equipmentField)
        equipmentField.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(titleField)
            make.top.equalTo(priceField.snp.bottom).offset(30)
        }
        
        clothField = TextFieldWithTrailerLine(title: "*Çalışanın işe nasıl bir kıyafet ile gelmesi gerektiği",
                                                  placeholder: "Takım elbise, serbest vb.")
        bottomView.addSubview(clothField)
        clothField.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(titleField)
            make.top.equalTo(equipmentField.snp.bottom).offset(30)
        }
        
        descriptionField = TextFieldWithTrailerLine(title: "*Birkaç cümle ile işi açıkla...",
                                              placeholder: "İş tanımı")
        bottomView.addSubview(descriptionField)
        descriptionField.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(titleField)
            make.top.equalTo(clothField.snp.bottom).offset(30)
        }
        
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        bottomView.addSubview(backButton)
        backButton.snp.makeConstraints { (make) in
            make.left.equalTo(titleField)
            make.height.equalTo(44)
            make.width.equalTo(100)
            make.top.equalTo(descriptionField.snp.bottom).offset(20)
        }
        
        submitButton.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        bottomView.addSubview(submitButton)
        submitButton.snp.makeConstraints { (make) in
            make.right.equalTo(titleField)
            make.width.equalTo(150)
            make.height.equalTo(44)
            make.centerY.equalTo(backButton)
        }
    }
    
    @objc func submitTapped() {
        let vc = AdTimeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
