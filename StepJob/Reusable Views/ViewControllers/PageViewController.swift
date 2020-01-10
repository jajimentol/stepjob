//
//  PageViewController.swift
//  StepJob
//
//  Created by Jaji on 17.05.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import Foundation
import UIKit

protocol PageViewControllerProtocol {
    
    func setInterface()
    func setTargets()
    
}

class PageViewController: UIViewController {
    
    var slideValue: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    
    func addSlide() {
        let viewTapGesture = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(viewTapGesture)
    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    func getW() -> CGFloat {
        return self.view.frame.width
    }
    
    func getH() -> CGFloat {
        return self.view.frame.height
    }
    
    func addToolBar(textField: UITextField){
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.tintColor = UIColorFromRGB(0x6665ff)
        let doneButton = UIBarButtonItem(title: NSLocalizedString("ok", comment: ""), style: UIBarButtonItem.Style.done, target: self, action: #selector(closeKeyboard))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton,doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.inputAccessoryView = toolBar
    }
    
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }
}

typealias StandardViewController = PageViewController & PageViewControllerProtocol
