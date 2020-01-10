//
//  AdPreviewView.swift
//  StepJob
//
//  Created by Sirius on 16.12.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class AdPreviewView: UIView {
    
    var contentView: UIView?
    
    @IBOutlet weak var adTitleLabel: UILabel!
    @IBOutlet weak var adDescriptionLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func load() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
        contentView?.backgroundColor = UIColorFromRGB(0xFFF0F1)
        contentView?.layer.cornerRadius = 8.0
        contentView?.clipsToBounds = true
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "AdPreview", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
}
