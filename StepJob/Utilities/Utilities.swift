//
//  Utilities.swift
//  StepJob
//
//  Created by Jaji on 17.05.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import Foundation
import UIKit

func thinFont(size: CGFloat) -> UIFont {
    return UIFont(name: "HelveticaNeue-Thin", size: size)!
}

func boldFont(size: CGFloat) -> UIFont {
    return UIFont(name: "HelveticaNeue-Bold", size: size)!
}

func lightFont(size: CGFloat) -> UIFont {
    return UIFont(name: "HelveticaNeue-Light", size: size)!
}

func mediumFont(size: CGFloat) -> UIFont {
    return UIFont(name: "HelveticaNeue-Medium", size: size)!
}

func standardLabel(text: String,
                   size: CGFloat,
                   color: UIColor = UIColorFromRGB(0x2c2d3e)) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = lightFont(size: size)
    label.textColor = color
    return label
}

func curvedButton(text: String,
            color: UIColor,
            titleColor: UIColor = .white,
            font: UIFont = lightFont(size: 14.0)) -> UIButton {
    let button = UIButton()
    button.layer.cornerRadius = 8.0
    button.backgroundColor = color
    button.setTitle(text, for: .normal)
    button.setTitleColor(titleColor, for: .normal)
    button.titleLabel?.font = font
    return button
}

func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

func addBorder(to view: UIView) {
    
    view.layer.cornerRadius = 8
    view.layer.borderColor = UIColorFromRGB(0xf1f1f1).cgColor
    view.layer.borderWidth = 1.0
    
}

func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    let size = image.size
    
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    
    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
        newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    }
    
    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    
    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
}
