//
//  PropertyDetailViewController.swift
//  Properties
//
//  Created by Bo Lin on 2/1/18.
//  Copyright © 2018 Bo Lin. All rights reserved.
//

import UIKit

class PropertyDetailViewController: UIViewController {

    @IBOutlet weak var detailsTextView: UITextView!
    
    // MARK: - Model
    var property: Property? {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        if let property = self.property {
            detailsTextView?.text = property.description
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }


}
