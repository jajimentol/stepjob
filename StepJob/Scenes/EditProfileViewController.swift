//
//  EditProfileViewController.swift
//  StepJob
//
//  Created by Sirius on 11.02.2020.
//  Copyright © 2020 Stepjob. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var photoButton: UIButton!
    
    @IBOutlet weak var nameField: TextFieldWithTrailerLine!
    @IBOutlet weak var surnameField: TextFieldWithTrailerLine!
    @IBOutlet weak var aboutField: TextFieldWithTrailerLine!
    @IBOutlet weak var ageField: TextFieldWithTrailerLine!
    
    @IBOutlet weak var phoneField: TextFieldWithTrailerLine!
    @IBOutlet weak var mailField: TextFieldWithTrailerLine!
    @IBOutlet weak var addressField: TextFieldWithTrailerLine!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setInterface()
    }

    func setInterface() {
        
        nameField.create(title: "İsim", placeholder: "")
        surnameField.create(title: "Soyisim", placeholder: "")
        aboutField.create(title: "Hakkınızda", placeholder: "")
        ageField.create(title: "Yaşınız", placeholder: "")
        phoneField.create(title: "Telefon numarası", placeholder: "")
        mailField.create(title: "E-posta adresi", placeholder: "")
        addressField.create(title: "Adres", placeholder: "")
        
        profilePhoto.layer.cornerRadius = 40.0
        profilePhoto.clipsToBounds = true
        
        photoButton.layer.cornerRadius = 22.0
        photoButton.clipsToBounds = true
        fillPage()
    }
    
    func fillPage() {
        
        if isUserEmployer ?? false {
            
            nameField.textfield.text = employerUser?.organizationName
            
        } else {
            
            if let url = URL(string: workerUser?.profilePicture ?? "") {
                DispatchQueue.global().async {
                        if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            self.profilePhoto.image = UIImage(data: data)
                        }
                    }
                }
            }
            
            nameField.textfield.text = workerUser?.fullName
            aboutField.textfield.text = workerUser?.about
            ageField.textfield.text = String(workerUser?.age ?? 0)
            ageField.textfield.keyboardType = .numberPad
            phoneField.textfield.text = workerUser?.phoneNumber
            phoneField.textfield.keyboardType = .numberPad
            mailField.textfield.text = workerUser?.email
            addressField.textfield.text = workerUser?.location
        }
        
    }
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func saveTapped(_ sender: Any) {
        
    }
}
