//
//  PremiumPropertyCell.swift
//  Properties
//
//  Created by Bo Lin on 3/1/18.
//  Copyright © 2018 Bo Lin. All rights reserved.
//

import UIKit

class PremiumPropertyCell: PropertyCell {

    @IBOutlet weak var premiumImageView: UIImageView! { didSet { premiumImageView?.tintColor = #colorLiteral(red: 0.8509803922, green: 0.3254901961, blue: 0.3098039216, alpha: 1) } }
    
}
