//
//  CollectionViewTVC.swift
//  StepJob
//
//  Created by Sirius on 9.01.2020.
//  Copyright © 2020 Stepjob. All rights reserved.
//

import UIKit

class CollectionViewTVC: UITableViewCell {

    let layout = UICollectionViewFlowLayout()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layout.itemSize = CGSize(width: 100, height: 110)
        layout.scrollDirection = .horizontal
        
        collectionView.register(UINib(nibName: "CircleWithLabelCVC", bundle: nil), forCellWithReuseIdentifier: "CircleWithLabelCVC")
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
}
