//
//  LoginViewController.swift
//  StepJob
//
//  Created by Jaji on 17.05.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: StandardViewController {
    
    var titleLabel = standardLabel(text: NSLocalizedString("login_title",
                                                           comment: ""),
                                   size: 20)
    
    var loginButton = curvedButton(text: NSLocalizedString("login",
                                                           comment: ""),
                                   color: UIColorFromRGB(0xff6265))
    
    var employerButton = curvedButton(text: NSLocalizedString("employer_login_title",
                                                           comment: ""),
                                   color: UIColorFromRGB(0xff6265))
    
    var forgotPasswordButton = UIButton()
    
    var emailField: TextFieldWithTrailerLine!
    var passwordField: TextFieldWithTrailerLine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("login_nav", comment: "")
        
        setInterface()
        
        setTargets()
        
    }
    
    func setInterface() {
        titleLabel.font = boldFont(size: 20.0)
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-53)
            make.top.equalTo(view).offset(50)
        }
        
        emailField = TextFieldWithTrailerLine.init(title: "E-posta adresi", placeholder: "")
        emailField.textfield.keyboardType = .emailAddress
        addToolBar(textField: emailField.textfield)
        view.addSubview(emailField)
        emailField.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.equalTo(60)
            make.top.equalTo(titleLabel.snp.bottom).offset(48)
        }
        
        passwordField = TextFieldWithTrailerLine.init(title: "Şifre", placeholder: "", hasSecure: true)
        addToolBar(textField: passwordField.textfield)
        view.addSubview(passwordField)
        passwordField.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(emailField)
            make.top.equalTo(emailField.snp.bottom).offset(48)
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(32)
            make.right.equalTo(view).offset(-32)
            make.height.equalTo(48)
            make.top.equalTo(passwordField.snp.bottom).offset(48)
        }
        
        forgotPasswordButton.setTitleColor(UIColorFromRGB(0xff6265), for: .normal)
        forgotPasswordButton.setTitle(NSLocalizedString("forgot_password", comment: ""), for: .normal)
        forgotPasswordButton.titleLabel?.font = lightFont(size: 14.0)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordTapped), for: .touchUpInside)
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(80)
            make.right.equalTo(view).offset(-80)
            make.height.equalTo(40)
            make.top.equalTo(loginButton.snp.bottom).offset(40)
        }
        addSlide()
        
        view.addSubview(employerButton)
        employerButton.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(loginButton)
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(24)
        }
    }
    
    func setTargets() {
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        employerButton.addTarget(self, action: #selector(employerTapped), for: .touchUpInside)
    }
    
    @objc func loginTapped() {
        let vc = MainViewController()
        navigationController?.setViewControllers([vc], animated: true)
        
    }
    
    @objc func employerTapped() {
        let vc = EmployerTabBarController()
        navigationController?.setViewControllers([vc], animated: true)
        
    }
    
    @objc func forgotPasswordTapped() {
//        let vc = AdDescriptionViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }
    
}
