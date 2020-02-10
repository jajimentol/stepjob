//
//  MyJobsViewController.swift
//  StepJob
//
//  Created by Sirius on 10.02.2020.
//  Copyright © 2020 Stepjob. All rights reserved.
//

import UIKit
import ObjectMapper

class MyJobsViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var layout = UICollectionViewFlowLayout()
    
    var appliedJobs: [JobsWithStatus]? {
        didSet {
            collectionView.reloadData()
        }
    }
    var waitingJobs: [JobsWithStatus]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getJobs()
        
        let width = (view.frame.width - 60) / 2
        let heigth = width
        layout.itemSize = CGSize(width: width, height: heigth)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MyJobCVC", bundle: nil), forCellWithReuseIdentifier: "MyJobCVC")
    }
    
    func getJobs() {
        
        WebService().getJobsByStatus(status: "APPROVED") { [weak self] (response, error) in
            guard let strongSelf = self else { return }
            if !error, let appliedJobs = Mapper<MyJobsList>().map(JSON: response) {
                strongSelf.appliedJobs = appliedJobs.jobs
            }
        }
 
        WebService().getJobsByStatus(status: "WAITING") { [weak self] (response, error) in
            guard let strongSelf = self else { return }
            if !error, let waitingJobs = Mapper<MyJobsList>().map(JSON: response) {
                strongSelf.waitingJobs = waitingJobs.jobs
            }
        }
    }
    
    @IBAction func controlValueChanged(_ sender: UISegmentedControl) {
        collectionView.reloadData()
    }
}

extension MyJobsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return appliedJobs?.count ?? 0
        } else if segmentedControl.selectedSegmentIndex == 1 {
            return waitingJobs?.count ?? 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if segmentedControl.selectedSegmentIndex == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyJobCVC", for: indexPath) as? MyJobCVC,
                let job = appliedJobs?[indexPath.item] {
                cell.fillCell(with: job)
                cell.delegate = self
                return cell
            }
        } else if segmentedControl.selectedSegmentIndex == 1 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyJobCVC", for: indexPath) as? MyJobCVC,
                let job = waitingJobs?[indexPath.item] {
                cell.fillCell(with: job)
                cell.delegate = self
                return cell
            }
        }
        return UICollectionViewCell()
    }
}

extension MyJobsViewController: MyJobApplicationDelegate {
    func cancelApplicationTapped(jobId: Int) {
        WebService().cancelApplicationForJob(jobId: jobId) { [weak self] (response, error) in
            guard let strongSelf = self else { return }
            if !error {
                strongSelf.getJobs()
            }
        }
    }
}
