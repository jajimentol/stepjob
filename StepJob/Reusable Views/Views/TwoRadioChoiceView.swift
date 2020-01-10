//
//  TwoRadioChoiceView.swift
//  StepJob
//
//  Created by Sirius on 9.12.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class TwoRadioChoiceView: UIView {
    
    var leftChoice = RadioChoiceView()
    var rightChoice = RadioChoiceView()
    
    var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.font = mediumFont(size: 16.0)
        titleLabel.textColor = .darkGray
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(20)
            make.top.equalTo(self)
        }
        addSubview(leftChoice)
        addSubview(rightChoice)
    }
    
    func setupChoices(title: String, left: String, right: String) {
        leftChoice.fillChoice(text: left, delegate: self as RadioChoiceDelegate)
        rightChoice.fillChoice(text: right, delegate: self as RadioChoiceDelegate)
        
        leftChoice.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.height.equalTo(25)
            make.right.equalTo(self.snp.centerX)
        }
        
        rightChoice.snp.makeConstraints { (make) in
            make.top.height.width.equalTo(leftChoice)
            make.left.equalTo(leftChoice.snp.right)
        }
        
        titleLabel.text = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TwoRadioChoiceView: RadioChoiceDelegate {
    func choiceTapped(choice: RadioChoiceView) {
        if choice == leftChoice {
            leftChoice.isActive = true
            rightChoice.isActive = false
        } else {
            leftChoice.isActive = false
            rightChoice.isActive = true
        }
    }
}
