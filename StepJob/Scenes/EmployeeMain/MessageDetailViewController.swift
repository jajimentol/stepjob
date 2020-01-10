//
//  MessageDetailViewController.swift
//  StepJob
//
//  Created by Sirius on 1.12.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class MessageDetailViewController: StandardViewController {
    
    var tableView = UITableView()
    
    var textField = UITextField()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        
        setInterface()
    }
    
    func setInterface() {
        navigationItem.title = "Adil Şişman"
        view.backgroundColor = .white
        textField.placeholder = "Bir şeyler yaz..."
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 16.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.bottom.equalTo(view).offset(-8)
            make.left.equalTo(view).offset(16)
            make.right.equalTo(view).offset(-16)
            make.height.equalTo(44)
        }
        
        setupTableView()
    }
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "OtherMessageTVC", bundle: nil), forCellReuseIdentifier: "OtherMessageTVC")
        tableView.register(UINib(nibName: "SelfMessageTVC", bundle: nil), forCellReuseIdentifier: "SelfMessageTVC")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(view)
            make.bottom.equalTo(textField.snp.top).offset(-8)
        }
        
    }
    
    func setTargets() {
    }
    
}

extension MessageDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row.isMultiple(of: 2) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelfMessageTVC", for: indexPath) as! SelfMessageTVC
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OtherMessageTVC", for: indexPath) as! OtherMessageTVC
            return cell
        }
    }
    
}
