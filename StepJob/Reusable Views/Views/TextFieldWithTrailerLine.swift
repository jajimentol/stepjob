//
//  TextFieldWithTrailerLine.swift
//  StepJob
//
//  Created by Sirius on 13.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class TextFieldWithTrailerLine: UIView {
    
    var line = UIImageView()
    
    var textfield = UITextField()
    
    var titleLabel = UILabel()
    
    var rightButton = UIButton()
    
    init(title: String, placeholder:String, hasSecure: Bool = false) {
        super.init(frame: .zero)
        
        titleLabel.font = mediumFont(size: 14.0)
        titleLabel.textColor = UIColorFromRGB(0x404259)
        titleLabel.numberOfLines = 0
        titleLabel.text = title
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(16)
            make.top.equalTo(self)
            make.right.equalTo(self).offset(-10)
        }
        
        textfield.font = mediumFont(size: 16.0)
        textfield.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                                                                          NSAttributedString.Key.font : lightFont(size: 14.0)])
        textfield.adjustsFontSizeToFitWidth = true
        addSubview(textfield)
        textfield.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.right.equalTo(self).offset(-8)
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.bottom.equalTo(self)
        }
        
        line.backgroundColor = UIColorFromRGB(0x404259)
        addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(textfield)
            make.height.equalTo(1)
        }
        
        textfield.isSecureTextEntry = hasSecure
        
    }
    
    func create(title: String, placeholder:String, hasSecure: Bool = false) {
        
        titleLabel.font = mediumFont(size: 14.0)
        titleLabel.textColor = UIColorFromRGB(0x404259)
        titleLabel.numberOfLines = 0
        titleLabel.text = title
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(16)
            make.top.equalTo(self)
            make.right.equalTo(self).offset(-10)
        }
        
        textfield.font = mediumFont(size: 16.0)
        textfield.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                                                                          NSAttributedString.Key.font : lightFont(size: 14.0)])
        textfield.adjustsFontSizeToFitWidth = true
        addSubview(textfield)
        textfield.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.right.equalTo(self).offset(-8)
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.bottom.equalTo(self)
        }
        
        line.backgroundColor = UIColorFromRGB(0x404259).withAlphaComponent(0.7)
        addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(textfield)
            make.height.equalTo(1)
        }
        
        textfield.isSecureTextEntry = hasSecure
        
    }
    
    func lightTitle() {
        titleLabel.textColor = UIColorFromRGB(0x404259).withAlphaComponent(0.8)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
}
