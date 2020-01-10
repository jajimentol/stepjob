//
//  JobDetailViewController.swift
//  StepJob
//
//  Created by Sirius on 23.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class JobDetailViewController: UIViewController {
    @IBOutlet weak var submitButton: UIButton!
    
    var isEmployer: Bool = false
    
    @IBOutlet weak var editButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "İlan Detayı"
        submitButton.layer.cornerRadius = 8.0
        setInterface()
    }
    
    func setInterface() {
        if isEmployer {
            editButton.layer.cornerRadius = 22.0
            submitButton.isHidden = true
            editButton.isHidden = false
        } else {
            editButton.isHidden = true
            submitButton.isHidden = false
        }
        
    }
    @IBAction func submitTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
