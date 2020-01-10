//
//  AdTimeViewController.swift
//  StepJob
//
//  Created by Sirius on 9.12.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class AdTimeViewController: AdViewController {
    
    var typeChoice = TwoRadioChoiceView()
    var timeChoice = TwoRadioChoiceView()
    
    var dayCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    var daysLayout = UICollectionViewFlowLayout()
    var collectionViewLabel = standardLabel(text: "İş haftanın hangi günlerinde yapılacak",
                                            size: 16.0, color: .darkGray)
    
    var backButton = curvedButton(text: "GERİ", color: .clear, titleColor: .lightGray, font: boldFont(size: 18.0))
    var submitButton = curvedButton(text: "DEVAM", color: UIColorFromRGB(0xF32042), titleColor: .white, font: boldFont(size: 18.0))
    
    
    var textField = UITextField()
    
    override func viewDidLoad() {
        step = 2
        super.viewDidLoad()
        
        setupPage()
    }
    
    @objc func submitTapped() {
        let vc = AdPreviewViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupPage() {
        bottomView.addSubview(typeChoice)
       typeChoice.snp.makeConstraints { (make) in
           make.left.right.equalTo(view)
           make.top.equalTo(titleLabel.snp.bottom).offset(20)
           make.height.equalTo(50)
       }
       typeChoice.setupChoices(title: "İlan Tipi",left: "Günlük", right: "Part-time")
       
       bottomView.addSubview(collectionViewLabel)
       collectionViewLabel.snp.makeConstraints { (make) in
           make.left.equalTo(bottomView).offset(20)
           make.top.equalTo(typeChoice.snp.bottom).offset(10)
       }
       
       daysLayout.scrollDirection = .horizontal
       daysLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
       daysLayout.minimumLineSpacing = 5
       daysLayout.minimumInteritemSpacing = 5
       daysLayout.itemSize = CGSize(width: 90, height: 55)
       dayCollectionView.setCollectionViewLayout(daysLayout, animated: false)
       dayCollectionView.delegate = self
       dayCollectionView.dataSource = self
       dayCollectionView.backgroundColor = .clear
       dayCollectionView.showsHorizontalScrollIndicator = false
       dayCollectionView.register(UINib(nibName: "SingleLabelCVC", bundle: nil), forCellWithReuseIdentifier: "SingleLabelCVC")
       bottomView.addSubview(dayCollectionView)
       dayCollectionView.snp.makeConstraints { (make) in
           make.left.right.equalTo(view)
           make.top.equalTo(collectionViewLabel.snp.bottom).offset(5)
           make.height.equalTo(60)
       }
       
       bottomView.addSubview(timeChoice)
       timeChoice.snp.makeConstraints { (make) in
           make.left.right.height.equalTo(typeChoice)
           make.top.equalTo(dayCollectionView.snp.bottom).offset(10)
       }
       timeChoice.setupChoices(title: "Mesai Saatleri", left: "Mesai saatleri", right: "Belli değil")
       
       textField.placeholder = "İl veya ilçede ara..."
       textField.layer.cornerRadius = 4.0
       textField.layer.borderColor = UIColor.lightGray.cgColor
       textField.layer.borderWidth = 1.0
       textField.leftViewRect(forBounds: CGRect(x: 0, y: 0, width: 20, height: 50))
       textField.leftViewMode = .always
       bottomView.addSubview(textField)
       textField.snp.makeConstraints { (make) in
           make.left.equalTo(bottomView).offset(20)
           make.width.equalTo(bottomView).offset(-50)
           make.height.equalTo(50)
           make.top.equalTo(timeChoice.snp.bottom).offset(20)
       }
       
       backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
       bottomView.addSubview(backButton)
       backButton.snp.makeConstraints { (make) in
           make.left.equalTo(typeChoice).offset(20)
           make.height.equalTo(44)
           make.width.equalTo(100)
           make.top.equalTo(textField.snp.bottom).offset(20)
       }
       
       submitButton.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
       bottomView.addSubview(submitButton)
       submitButton.snp.makeConstraints { (make) in
           make.right.equalTo(typeChoice).offset(-20)
           make.width.equalTo(150)
           make.height.equalTo(44)
           make.centerY.equalTo(backButton)
       }
               
    }
    
}

extension AdTimeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SingleLabelCVC", for: indexPath) as! SingleLabelCVC
        cell.setup(day: indexPath.item)
        return cell
    }
    
    
    
    
}
