//
//  PremiumPropertyCell.swift
//  Properties
//
//  Created by Bo Lin on 3/1/18.
//  Copyright © 2018 Bo Lin. All rights reserved.
//

import UIKit

class PremiumPropertyCell: PropertyCell {
    
    @IBOutlet weak var premiumButton: UIButton! {
        didSet {
            premiumButton?.tintColor = #colorLiteral(red: 0.8509803922, green: 0.3254901961, blue: 0.3098039216, alpha: 1)
        }
    }
    
    @IBAction func flinker(_ sender: UIButton? = nil) {
        UIView.animate(withDuration: 0.4,
                       delay: 0.2,
                       options: .curveEaseInOut,
                       animations: {
                        sender?.tintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        }) { (success) in
            UIView.animate(withDuration: 0.8,
                           delay: 0.5,
                           options: .curveEaseInOut,
                           animations: {
                            sender?.tintColor = #colorLiteral(red: 0.8509803922, green: 0.3254901961, blue: 0.3098039216, alpha: 1)
            })
        }
    }
    
}
