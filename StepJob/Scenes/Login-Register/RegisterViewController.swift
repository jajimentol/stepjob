//
//  RegisterViewController.swift
//  StepJob
//
//  Created by Sirius on 13.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit
import ObjectMapper

class RegisterViewController: StandardViewController {
    
    var titleLabel = standardLabel(text: "StepJob'a Kaydol", size: 18.0, color: UIColorFromRGB(0x404259))
    
    var mailField: TextFieldWithTrailerLine!
    var companyField: TextFieldWithTrailerLine!
    var areaField: TextFieldWithTrailerLine!
    var passwordField: TextFieldWithTrailerLine!
    var passwordField2: TextFieldWithTrailerLine!
    
    var scrollView = UIScrollView()
    
    var submitButton = curvedButton(text: "HEMEN KAYDOL", color: UIColorFromRGB(0xff3f55))
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInterface()
        setTargets()
    }
    
    func setInterface() {
        addSlide()
        scrollView.contentSize = CGSize(width: getW(), height: getH() + 100)
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(view)
        }
        
        titleLabel.font = boldFont(size: 22.0)
        scrollView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(24)
            make.top.equalTo(scrollView).offset(32)
        }
        
        mailField = TextFieldWithTrailerLine.init(title: "E-posta adresi", placeholder: "E-posta adresinizi giriniz")
        mailField.lightTitle()
        addToolBar(textField: mailField.textfield)
        scrollView.addSubview(mailField)
        mailField.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.right.equalTo(view).offset(-24)
            make.height.equalTo(50)
        }
        
        companyField = TextFieldWithTrailerLine.init(title: "Firma Adı", placeholder: "Firmanızın/işletmenizin adını giriniz.")
        companyField.lightTitle()
        addToolBar(textField: companyField.textfield)
        scrollView.addSubview(companyField)
        companyField.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(mailField)
            make.top.equalTo(mailField.snp.bottom).offset(24)
        }
        
        areaField = TextFieldWithTrailerLine.init(title: "Çalışma Alanı", placeholder: "Firmanızın çalışma alanını belirtiniz.")
        areaField.lightTitle()
        addToolBar(textField: areaField.textfield)
        scrollView.addSubview(areaField)
        areaField.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(companyField)
            make.top.equalTo(companyField.snp.bottom).offset(24)
        }
        
        passwordField = TextFieldWithTrailerLine.init(title: "Şifre", placeholder: "En az 6 karakterden oluşan şifrenizi giriniz.",
                                                      hasSecure: true)
        passwordField.lightTitle()
        addToolBar(textField: passwordField.textfield)
        scrollView.addSubview(passwordField)
        passwordField.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(areaField)
            make.top.equalTo(areaField.snp.bottom).offset(24)
        }
        
        passwordField2 = TextFieldWithTrailerLine.init(title: "Şifre tekrar", placeholder: "Şifrenizi tekrar giriniz",
                                                       hasSecure: true)
        passwordField2.lightTitle()
        addToolBar(textField: passwordField2.textfield)
        scrollView.addSubview(passwordField2)
        passwordField2.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(passwordField)
            make.top.equalTo(passwordField.snp.bottom).offset(24)
        }
        
        scrollView.addSubview(submitButton)
        submitButton.snp.makeConstraints { (make) in
            make.left.right.equalTo(mailField)
            make.top.equalTo(passwordField2.snp.bottom).offset(40)
            make.height.equalTo(50)
        }
    }
    
    func setTargets() {
    }
    
    @objc func submitTapped() {
        
//        let request = EmployerRegisterRequest()
//        request.makeParameter(area: areaField.textfield.text ?? "",
//                              email: mailField.textfield.text ?? "",
//                              organization: companyField.textfield.text ?? "",
//                              password: passwordField.textfield.text ?? "")
//        
//        WebService().employerRegister(parameters: request.parameters) { (response, error) in
//            if !error {
//                let response:EmployerRegisterResponse = Mapper<EmployerRegisterResponse>().map(JSONObject:response)
//                
//                
//            }
//        }
        
    }
}
