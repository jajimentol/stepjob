//
//  RadioChoiceView.swift
//  StepJob
//
//  Created by Sirius on 9.12.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

protocol RadioChoiceDelegate: class {
    
    func choiceTapped(choice: RadioChoiceView)
    
}

class RadioChoiceView: UIView {
    
    var circle = UIImageView()
    var titleLabel = UILabel()
    
    var isActive: Bool = false {
        willSet {
            if newValue {
                circle.image = UIImage(named: "okey")
            } else {
                circle.image = nil
            }
        }
    }
    
    weak var delegate: RadioChoiceDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        circle.layer.cornerRadius = 11
        circle.layer.borderColor = UIColor.darkGray.cgColor
        circle.layer.borderWidth = 1
        circle.backgroundColor = .clear
        addSubview(circle)
        circle.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(4)
            make.centerY.equalTo(self)
            make.height.width.equalTo(22)
        }
        
        titleLabel.font = mediumFont(size: 16.0)
        titleLabel.textColor = .darkGray
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(circle.snp.right).offset(5)
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(choiceTapped))
        addGestureRecognizer(tap)
    }
    
    func fillChoice(text: String, delegate: RadioChoiceDelegate) {
        
        titleLabel.text = text
        self.delegate = delegate
        
    }
    
    @objc func choiceTapped() {
        delegate?.choiceTapped(choice: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
