//
//  DetailsVC.swift
//  iTunesTask
//
//  Created by Mahmoud Salaheldin on 2/8/21.
//  Copyright © 2021 Mahmoud Salaheldin. All rights reserved.
//

import UIKit

class DetailsVC: BaseViewController {
    
    //MARK: - Outlets
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    //MARK: - Variables
    
    lazy var viewModel = DetailsViewModel()
    
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.getSearchResult()
        setupViewModel()
        setupSegmentStyle()
        title = "Search Result"
    }
    
    
    //MARK: - Initialization
    
    class func initializeFromStoryboard() -> DetailsVC {
        
        let storyboard = UIStoryboard(name: Storyboards.Details, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: DetailsVC.self)) as! DetailsVC
    }
    
    
    // MARK: - Helper Methods
    
    func setupViewModel() {
        viewModel.showLoadingIndicator = { [weak self] in
            self?.activityIndicator.startAnimating()
        }
        
        viewModel.reloadTableView = { [weak self] in
            self?.tableView.reloadData()
            
        }
        
        viewModel.hideLoadingIndicator = { [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.activityIndicator.isHidden = true
        }
        
        viewModel.showAlert = { [weak self] (title,message) in
            
            self?.alert(title: title, message: message)
        }
    }
    
    func setSearchParameters(searchText: String? , categories:[String]?) {
        viewModel.searchText = searchText
        viewModel.categories = categories
    }
    
    func setupSegmentStyle() {
        segmentControl.selectedSegmentIndex = SegmentStates.list.rawValue
    }
    
    
    // MARK: - Actions
    
    @IBAction func segmentControllerWasPressed(_ sender: Any) {
        
        tableView.reloadData()
    }
    
}
