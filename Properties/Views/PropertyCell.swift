//
//  PropertyCell.swift
//  Properties
//
//  Created by Bo Lin on 2/1/18.
//  Copyright © 2018 Bo Lin. All rights reserved.
//

import UIKit
import SDWebImage

class PropertyCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var propertyImageView: UIImageView!
    @IBOutlet weak var propertyTitleLabel: UILabel!
    @IBOutlet weak var propertyAddressLabel: UILabel!
    @IBOutlet weak var propertyPriceLabel: UILabel!
    
    @IBOutlet weak var bedroomsLabel: UILabel!
    @IBOutlet weak var bathroomsLabel: UILabel!
    @IBOutlet weak var carspotsLabel: UILabel!
    
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    
    // MARK: - Model
    var property: Property? {
        didSet { updateUI() }
    }
    
    private func updateUI() {
        if let property = self.property {
            propertyTitleLabel?.text = property.title
            propertyAddressLabel?.text = property.location.address
            propertyPriceLabel?.text = (property.price as NSNumber).priceString
            propertyImageView?.sd_setShowActivityIndicatorView(true)
            propertyImageView?.sd_setIndicatorStyle(.gray)
            propertyImageView?.sd_setImage(with: property.photoMediumURL)
            
            let iconSize = CGRect(x: 0, y: -4, width: 16, height: 16)   // magic number to set icon size
            bedroomsLabel?.attributedText = attributedText(string: "\(property.bedrooms) ", image: #imageLiteral(resourceName: "bedrooms") , iconSize: iconSize)
            bathroomsLabel?.attributedText = attributedText(string: "\(property.bathrooms) ", image: #imageLiteral(resourceName: "bathrooms"), iconSize: iconSize)
            carspotsLabel?.attributedText = attributedText(string: "\(property.carspots) ", image: #imageLiteral(resourceName: "carspots"), iconSize: iconSize)
            
            ownerImageView?.sd_setImage(with: property.owner.avatarMediumURL)
            ownerNameLabel?.text = property.owner.fullName
        }
    }
    
    // a helper method to convert string and image to NSMutableAttributedString
    private func attributedText(string: String, image: UIImage, iconSize: CGRect) -> NSMutableAttributedString {
        // create an NSMutableAttributedString that we'll append everything to
        let fullString = NSMutableAttributedString(string: string)
        
        // create our NSTextAttachment
        let image1Attachment = NSTextAttachment()
        image1Attachment.image = image
        image1Attachment.bounds = iconSize
        
        // wrap the attachment in its own attributed string so we can append it
        let image1String = NSAttributedString(attachment: image1Attachment)
        
        // add the NSTextAttachment wrapper to our full string, then add some more text.
        fullString.append(image1String)
        
        return fullString
    }
    
}

extension NSNumber {
    var priceString: String? {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.minimumFractionDigits = 0
        // localize to your grouping and decimal separator
        currencyFormatter.locale = NSLocale.current
        return currencyFormatter.string(from: self)
    }
}
