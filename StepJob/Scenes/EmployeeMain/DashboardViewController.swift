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
    
    var tableView = UITableView()
    
    var cityPicker = UIPickerView()
    var countyPicker = UIPickerView()
    var typePicker = UIPickerView()
    
    let cities = ["", "İstanbul", "Ankara", "İzmir"]
    let counties = ["", "Kadıköy", "Üsküdar", "Dikmen", "Bornova"]
    let types = ["", "Günlük", "Günlük Kiralık", "Mevsimlik"]
    
    var cityField: UITextField!
    var countyField: UITextField!
    var typeField: UITextField!
    
    var jobs: [Job]? {
        didSet {
            tableView.reloadData()
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
        tableView.register(UINib(nibName: "DashboardHeaderTVC", bundle: nil), forCellReuseIdentifier: "DashboardHeaderTVC")
        tableView.register(UINib(nibName: "DashboardJobTVC", bundle: nil), forCellReuseIdentifier: "DashboardJobTVC")
        tableView.register(UINib(nibName: "CollectionViewTVC", bundle: nil), forCellReuseIdentifier: "CollectionViewTVC")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(view)
        }
        
        cityPicker.delegate = self
        cityPicker.dataSource = self
        
        countyPicker.delegate = self
        countyPicker.dataSource = self
        
        typePicker.delegate = self
        typePicker.dataSource = self
    }
    
    func setTargets() {
    }
    
    func getJobs() {
        
        WebService().workerJobs { [weak self] (response, error) in
            guard let strongSelf = self else { return }
            if !error, let jobs = Mapper<Jobs>().map(JSONObject: response) {
                strongSelf.jobs = jobs.jobs
            }
        }
        
    }
    
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 2 {
            return jobs?.count ?? 0
        } else if section == 1 {
            return 1
        } else {return 0}
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardHeaderTVC", for: indexPath) as! DashboardHeaderTVC
            cell.setDelegates(cityPicker: cityPicker, countyPicker: countyPicker, typePicker: typePicker)
            let set: () -> () = { [weak self] in
                self?.cityField = cell.cityField
                self?.countyField = cell.countyField
                self?.typeField = cell.typeField
            }
            set()
            return cell
        } else if indexPath.section == 2 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardJobTVC",
                                                        for: indexPath) as? DashboardJobTVC,
                let job = jobs?[indexPath.row] {
                    cell.fillCell(with: job)
                    return cell
            }
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionViewTVC", for: indexPath) as! CollectionViewTVC
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = JobDetailViewController(nibName: "JobDetailViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension DashboardViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == cityPicker {
            return cities.count
        } else if pickerView == countyPicker {
            return counties.count
        } else if pickerView == typePicker {
            return types.count
        } else { return 0 }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == cityPicker {
            return cities[row]
        } else if pickerView == countyPicker {
            return counties[row]
        } else if pickerView == typePicker {
            return types[row]
        } else { return "" }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == cityPicker {
            cityField?.text = cities[row]
        } else if pickerView == countyPicker {
            countyField?.text = counties[row]
        } else if pickerView == typePicker {
            typeField?.text = types[row]
        }
    }
}

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CircleWithLabelCVC", for: indexPath) as! CircleWithLabelCVC
        cell.fillCell(type: indexPath.item)
        return cell
    }
}
