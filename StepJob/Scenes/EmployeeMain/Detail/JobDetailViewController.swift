//
//  JobDetailViewController.swift
//  StepJob
//
//  Created by Sirius on 23.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit
import ObjectMapper

class JobDetailViewController: UIViewController {
    @IBOutlet weak var submitButton: UIButton!
    
    var isEmployer: Bool = false
    var jobData: Job?
    
    @IBOutlet weak var jobImage: UIImageView!
    @IBOutlet weak var jobNameLabel: UILabel!
    @IBOutlet weak var organizationNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var applyLabel: UILabel!
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "İlan Detayı"
        submitButton.layer.cornerRadius = 8.0
    
        getJobDetail()
    }
    
    func getJobDetail() {
        if !(isUserEmployer ?? false) {
            WebService().getWorkerJobDetail(jobId: jobData?.id ?? 0) { [weak self] (response, error) in
                guard let strongSelf = self else { return }
                if !error, let job = Mapper<Job>().map(JSON: response) {
                    strongSelf.jobData = job
                    strongSelf.setInterface()
                }
            }
        } else {
            WebService().getJobDetail(jobId: jobData?.id ?? 0) { [weak self] (response, error) in
                
                guard let strongSelf = self else { return }
                if !error, let job = Mapper<Job>().map(JSON: response) {
                    strongSelf.jobData = job
                    strongSelf.setInterface()
                }
            }
        }
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
        
        fillScene()
        
    }
    
    func fillScene() {
        
        if let url = URL(string: jobData?.employer?.profilePicture ?? "") {
            DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.jobImage.image = UIImage(data: data)
                    }
                }
            }
        }
        
        title = jobData?.title
        jobNameLabel.text = jobData?.title
        organizationNameLabel.text = jobData?.employer?.organizationName
        locationLabel.text = jobData?.address
        priceLabel.text = jobData?.price
        typeLabel.text = jobData?.jobType
        timeLabel.text = jobData?.creationDate
        applyLabel.text = String(jobData?.workerCount ?? "0") + " Başvuru"
        descriptionLabel.text = jobData?.description
        
        jobImage.layer.cornerRadius = 4.0
        jobImage.clipsToBounds = true
        
        if jobData?.isApplied ?? false {
            submitButton.isUserInteractionEnabled = false
            submitButton.setTitle("Başvuruldu", for: .normal)
            submitButton.backgroundColor = UIColor.lightGray
        }
        
    }
    @IBAction func submitTapped(_ sender: Any) {
        WebService().applyForJob(jobId: jobData?.id ?? 0) { [weak self] (response, error) in
            guard let strongSelf = self else { return }
        }
        navigationController?.popViewController(animated: true)
        
    }
}
