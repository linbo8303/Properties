//
//  PropertyTableViewController.swift
//  Properties
//
//  Created by Bo Lin on 2/1/18.
//  Copyright © 2018 Bo Lin. All rights reserved.
//

import UIKit

class PropertyTableViewController: UITableViewController, UISplitViewControllerDelegate {

    // for the UISplitViewControllerDelegate method below to work
    // we have to set ourself as the UISplitViewController's delegate
    override func awakeFromNib() {
        super.awakeFromNib()
        self.splitViewController?.delegate = self
    }
    
    // MARK: - UISplitViewControllerDelegate
    
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController
        ) -> Bool {
        if primaryViewController.contents == self {
            if secondaryViewController.contents is PropertyDetailViewController {
                return true
            }
        }
        return false
    }
    
    // MARK: - Model
    var properties = [Property]() { didSet { tableView.reloadData() } }
    
    private struct Constants {
        static let CellIdentifier = "PropertyCell"
        static let PremiumCellIdentifier = "PremiumPropertyCell"
        static let SegueShowPropertyDetail = "show property detail"
    }
    
    private let path = "http://demo0065087.mockable.io/test/properties"
    // fetch properties data remotely and set to Model
    private func fetchProperties(with path: String) {
        let propertyRequest = PropertyRequest(path)
        propertyRequest.fetchProperties(handler: { [weak self] (properties) in
            self?.properties = properties
        })
    }
    
    // refresh button to fetch property data
    @IBAction func refreshProperties(_ sender: UIBarButtonItem) {
        fetchProperties(with: path)
    }
    
    // MARK: - view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // any selection is cleared in viewWillAppear
        clearsSelectionOnViewWillAppear = true
        
        // register nib cell
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: Constants.CellIdentifier, bundle: nil),
                           forCellReuseIdentifier: Constants.CellIdentifier)
        tableView.register(UINib(nibName: Constants.PremiumCellIdentifier, bundle: nil),
                           forCellReuseIdentifier: Constants.PremiumCellIdentifier)
        
        fetchProperties(with: path)
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let property = properties[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: property.isPremium ? Constants.PremiumCellIdentifier : Constants.CellIdentifier, for: indexPath)

        // Configure the cell...
        if let propertyCell = cell as? PropertyCell {
            propertyCell.property = property
        }

        return cell
    }

    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: Constants.SegueShowPropertyDetail, sender: cell)
    }

    // MARK: - Navigation

    // the public API of segue destination PropertyDetailViewController is property
    // currently it only shows property.description in a textView.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.SegueShowPropertyDetail,
            let destinationVC = segue.destination.contents as? PropertyDetailViewController,
            let cell = sender as? PropertyCell {
            destinationVC.property = cell.property
            destinationVC.title = cell.property?.title
        }
    }

}

extension UIViewController {
    // a friendly var we've added to UIViewController
    // it returns the "contents" of this UIViewController
    // which, if this UIViewController is a UINavigationController
    // means "the UIViewController contained in me (and visible)"
    // otherwise, it just means the UIViewController itself
    // could easily imagine extending this for UITabBarController too
    var contents: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}
