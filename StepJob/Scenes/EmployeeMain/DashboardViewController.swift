//
//  DashboardViewController.swift
//  StepJob
//
//  Created by Sirius on 22.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit
import ObjectMapper

class DashboardViewController: StandardViewController {
    
    var tableView = UITableView(frame: .zero, style: .grouped)
    
    var cityField: UITextField!
    var countyField: UITextField!
    var typeField: UITextField!
    
    var jobs: [Job]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var topJobs: [Job]? {
        didSet{
            (tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! CollectionViewTVC).collectionView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJobs()
        setInterface()
        setTargets()
    }
    
    func setInterface() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
//        tableView.register(UINib(nibName: "DashboardHeaderTVC", bundle: nil), forCellReuseIdentifier: "DashboardHeaderTVC")
        tableView.register(UINib(nibName: "DashboardJobTVC", bundle: nil), forCellReuseIdentifier: "DashboardJobTVC")
        tableView.register(UINib(nibName: "CollectionViewTVC", bundle: nil), forCellReuseIdentifier: "CollectionViewTVC")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.top.equalTo(view)
        }
    }
    
    func setTargets() {
    }
    
    func getJobs() {
        
        WebService().workerJobs { [weak self] (response, error) in
            guard let strongSelf = self else { return }
            if !error, let jobs = Mapper<Jobs>().map(JSONObject: response) {
                strongSelf.jobs = jobs.jobs
            }
        }
        
        WebService().getPopularWorkerJobs { [weak self] (response, error) in
            guard let strongSelf = self else { return }
            if !error, let topJobs = Mapper<Jobs>().map(JSONObject: response) {
                strongSelf.topJobs = topJobs.jobs
            }
        }
    }
    
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return jobs?.count ?? 0
        } else {return 0}
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionViewTVC", for: indexPath) as! CollectionViewTVC
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            return cell
        } else if indexPath.section == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardJobTVC",
                                                        for: indexPath) as? DashboardJobTVC,
                let job = jobs?[indexPath.row] {
                    cell.fillCell(with: job)
                    return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = JobDetailViewController(nibName: "JobDetailViewController", bundle: nil)
        vc.jobData = jobs?[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Sana Uygun İlanlar"
        } else if section == 0 {
            return "En Popüler İlanlar"
        }
        return ""
    }
}

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topJobs?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularJobCVC", for: indexPath) as! PopularJobCVC
        if let data = topJobs?[indexPath.row] {
            cell.fillCell(with: data)
        }
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        if kind == UICollectionView.elementKindSectionHeader {
//            let titleLabel = UILabel()
//            titleLabel.text = "En Popüler İlanlar"
//            return (titleLabel as! UICollectionReusableView)
//        }
//    }
}
