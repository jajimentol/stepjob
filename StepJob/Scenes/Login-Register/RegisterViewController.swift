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
    
    lazy var genderPickerView = UIPickerView()
    let genders = ["", "Erkek", "Kadın"]
    
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
        
        if isUserEmployer! {
            mailField = TextFieldWithTrailerLine.init(title: "E-posta adresi", placeholder: "E-posta adresinizi giriniz")
            companyField = TextFieldWithTrailerLine.init(title: "Firma Adı", placeholder: "Firmanızın/işletmenizin adını giriniz.")
            areaField = TextFieldWithTrailerLine.init(title: "Çalışma Alanı", placeholder: "Firmanızın çalışma alanını belirtiniz.")
            passwordField = TextFieldWithTrailerLine.init(title: "Şifre", placeholder: "En az 6 karakterden oluşan şifrenizi giriniz.", hasSecure: true)
            passwordField2 = TextFieldWithTrailerLine.init(title: "Şifre tekrar", placeholder: "Şifrenizi tekrar giriniz", hasSecure: true)
        } else {
            mailField = TextFieldWithTrailerLine.init(title: "E-posta adresi", placeholder: "E-posta adresinizi giriniz")
            companyField = TextFieldWithTrailerLine.init(title: "İsim Soyisim", placeholder: "Tam isminizi giriniz.")
            areaField = TextFieldWithTrailerLine.init(title: "Cinsiyet", placeholder: "Cinsiyetinizi seçiniz")
            areaField.textfield.inputView = genderPickerView
            genderPickerView.delegate = self
            passwordField = TextFieldWithTrailerLine.init(title: "Şifre", placeholder: "En az 6 karakterden oluşan şifrenizi giriniz.", hasSecure: true)
            passwordField2 = TextFieldWithTrailerLine.init(title: "Şifre tekrar", placeholder: "Şifrenizi tekrar giriniz", hasSecure: true)
        }
        
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
        
        mailField.lightTitle()
        addToolBar(textField: mailField.textfield)
        scrollView.addSubview(mailField)
        mailField.snp.makeConstraints { (make) in
            make.left.equalTo(view)
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.right.equalTo(view).offset(-24)
            make.height.equalTo(50)
        }
        
        
        companyField.lightTitle()
        addToolBar(textField: companyField.textfield)
        scrollView.addSubview(companyField)
        companyField.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(mailField)
            make.top.equalTo(mailField.snp.bottom).offset(24)
        }
        
        
        areaField.lightTitle()
        addToolBar(textField: areaField.textfield)
        scrollView.addSubview(areaField)
        areaField.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(companyField)
            make.top.equalTo(companyField.snp.bottom).offset(24)
        }
        
        passwordField.lightTitle()
        addToolBar(textField: passwordField.textfield)
        scrollView.addSubview(passwordField)
        passwordField.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(areaField)
            make.top.equalTo(areaField.snp.bottom).offset(24)
        }
        
        passwordField2.lightTitle()
        addToolBar(textField: passwordField2.textfield)
        scrollView.addSubview(passwordField2)
        passwordField2.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(passwordField)
            make.top.equalTo(passwordField.snp.bottom).offset(24)
        }
        
        scrollView.addSubview(submitButton)
        submitButton.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        submitButton.snp.makeConstraints { (make) in
            make.right.equalTo(mailField)
            make.left.equalTo(mailField).offset(24)
            make.top.equalTo(passwordField2.snp.bottom).offset(40)
            make.height.equalTo(50)
        }
    }
    
    func setTargets() {
    }
    
    @objc func submitTapped() {
        
        if isUserEmployer! {
            
            let request = EmployerRegisterRequest()
            request.makeParameter(area: 0,
                                  email: mailField.textfield.text ?? "",
                                  organization: companyField.textfield.text ?? "",
                                  password: passwordField.textfield.text ?? "")
    
            WebService().employerRegister(parameters: request.parameters) { [weak self] (response, error) in
                guard let strongSelf = self else { return }
                if !error {
                    if let response:EmployerRegisterResponse = Mapper<EmployerRegisterResponse>().map(JSONObject:response) {
                        print(response)
//                        employerUser = response
                        let vc = EmployerTabBarController()
                        strongSelf.navigationController?.setViewControllers([vc], animated: true)
                    }
                }
            }
            
        } else {

            let request = WorkerRegisterRequest()
            request.makeParameter(email: mailField.textfield.text ?? "",
                                  fullName: companyField.textfield.text ?? "",
                                  password: passwordField.textfield.text ?? "",
                                  genderId: areaField.textfield.text == "ERKEK" ? 0 : 1)
            WebService().workerRegister(parameters: request.parameters) { [weak self] (response, error) in
                guard let strongSelf = self else { return }
                if !error {
                    if let response: Worker = Mapper<Worker>().map(JSON: response) {
                        print(response)
                        let vc = MainViewController()
                        strongSelf.navigationController?.setViewControllers([vc], animated: true)
                        
                    }
                }
            }
        }
    }
}

extension RegisterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        areaField.textfield.text = genders[row]
    }
    
    
}
