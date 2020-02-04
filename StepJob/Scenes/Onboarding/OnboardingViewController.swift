//
//  OnboardingViewController.swift
//  StepJob
//
//  Created by Jaji on 17.05.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class OnboardingViewController: StandardViewController {
    
    var bottomView = UIView()
    
    var imagesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    var imagesPageControl = UIPageControl()
    
    var imagesLayout = UICollectionViewFlowLayout()
    
    var loginButton = UIButton()
    var signupButton = UIButton()
    
    var questionLabel = standardLabel(text: "Çalışan mı arıyorsun?", size: 14.0, color: UIColorFromRGB(0x404259))
    var questionButton = UIButton()
    
    var isEmployer: Bool = false
    
    override func viewDidLoad() {
        navigationController?.navigationBar.isHidden = true
        super.viewDidLoad()
        
        setInterface()
        setTargets()
        
    }

    func setInterface() {
        
        imagesLayout.itemSize = CGSize(width: getW(), height: getH())
        imagesLayout.scrollDirection = .horizontal
        imagesLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        imagesLayout.minimumLineSpacing = 0
        imagesLayout.minimumInteritemSpacing = 0
        
        imagesCollectionView.backgroundColor = .white
        imagesCollectionView.register(UINib(nibName: "OnboardingImageCVC", bundle: nil),
                                      forCellWithReuseIdentifier: "OnboardingImageCVC")
        imagesCollectionView.isPagingEnabled = true
        imagesCollectionView.setCollectionViewLayout(imagesLayout, animated: false)
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self
        view.addSubview(imagesCollectionView)
        imagesCollectionView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(view).offset(-22)
        }
        
        bottomView.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(view)
            make.height.equalTo(160)
        }
        
        imagesPageControl.numberOfPages = 3
        imagesPageControl.backgroundColor = .clear
        bottomView.addSubview(imagesPageControl)
        imagesPageControl.snp.makeConstraints { (make) in
            make.centerX.equalTo(bottomView)
            make.top.equalTo(bottomView)
        }
        
        loginButton = curvedButton(text: "GİRİŞ YAP", color: .clear,
                                   titleColor: UIColorFromRGB(0x404259), font: mediumFont(size: 14.0))
        loginButton.layer.borderWidth = 2.0
        loginButton.layer.cornerRadius = 24.0
        loginButton.layer.borderColor = UIColorFromRGB(0x404259).cgColor
        bottomView.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(8)
            make.top.equalTo(bottomView).offset(32)
            make.height.equalTo(48)
            make.width.equalTo(120)
        }
        
        signupButton = curvedButton(text: "OLUŞTUR", color: UIColorFromRGB(0x404259), titleColor: .white, font: mediumFont(size: 14.0))
        signupButton.layer.cornerRadius = 24.0
        bottomView.addSubview(signupButton)
        signupButton.snp.makeConstraints { (make) in
            make.left.equalTo(loginButton.snp.right).offset(8)
            make.top.equalTo(loginButton)
            make.height.equalTo(48)
            make.right.equalTo(view).offset(-8)
        }
        
        questionLabel.font = mediumFont(size: 16.0)
        bottomView.addSubview(questionLabel)
        questionLabel.snp.makeConstraints { (make) in
            make.left.equalTo(loginButton)
            make.top.equalTo(loginButton.snp.bottom).offset(24)
        }
        
        questionButton.setTitle("İşveren olarak giriş yapın.", for: .normal)
        questionButton.titleLabel?.font = boldFont(size: 14.0)
        questionButton.setTitleColor(.blue, for: .normal)
        bottomView.addSubview(questionButton)
        questionButton.snp.makeConstraints { (make) in
            make.left.equalTo(questionLabel.snp.right).offset(8)
            make.centerY.equalTo(questionLabel)
        }
        
        setTitles()
    }
    
    func setTitles() {
        if !isEmployer {
            questionLabel.text = "İş mi arıyorsun?"
            questionButton.setTitle("Çalışan olarak giriş yap", for: .normal)
        } else {
            questionLabel.text = "Çalışan mı arıyorsun?"
            questionButton.setTitle("İşveren olarak giriş yapın.", for: .normal)
        }
        isUserEmployer = isEmployer
    }

    func setTargets() {
        questionButton.addTarget(self, action: #selector(questionTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(signupTapped), for: .touchUpInside)
        
        UserDefaults.standard.set("", forKey: "sj-token")
    }
    
    @objc func questionTapped() {
        isEmployer.toggle()
        setTitles()
    }
    
    @objc func signupTapped() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func loginTapped() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingImageCVC", for: indexPath) as! OnboardingImageCVC
        cell.setImage(index: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        imagesPageControl.currentPage = indexPath.item
    }
    
}
