//
//  DashboardHeaderTVC.swift
//  StepJob
//
//  Created by Sirius on 23.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class DashboardHeaderTVC: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var countyField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    
    @IBOutlet weak var listButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        bgView.layer.cornerRadius = 8.0
        
        cityField.placeholder = "İl Seç"
        countyField.placeholder = "İlçe Seç"
        typeField.placeholder = "İlan Tipi"
        priceField.placeholder = "Ücret"
        priceField.keyboardType = .numberPad
        
        listButton.layer.cornerRadius = 8.0
    }
    
    func setDelegates(cityPicker: UIPickerView, countyPicker: UIPickerView, typePicker: UIPickerView) {
        
        cityField.inputView = cityPicker
        countyField.inputView = countyPicker
        typeField.inputView = typePicker
        
    }
    
}
