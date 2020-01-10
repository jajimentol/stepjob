//
//  CurvedTextField.swift
//  StepJob
//
//  Created by Jaji on 17.05.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol CustomTextFieldDelegate {
    
    
}

class CustomTextField: TextField {
    
    var customDelegate: CustomTextFieldDelegate?
    
    func create(placeholder: String) {
        
        addBorder(to: self)
        attributedPlaceholder = NSAttributedString(string: placeholder,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColorFromRGB(0x4a4a4a)])
        textColor = UIColor.black
        
        font = lightFont(size: 12.0)
        
    }
}
