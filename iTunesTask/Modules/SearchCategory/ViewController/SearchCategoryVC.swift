//
//  SearchCategory.swift
//  iTunesTask
//
//  Created by Mahmoud Salaheldin on 2/8/21.
//  Copyright © 2021 Mahmoud Salaheldin. All rights reserved.
//

import UIKit

class SearchCategoryVC: BaseViewController {
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Variables
    
    lazy var viewModel = SearchCategoryViewModel()
    var setSelectedCategories : ((_ categories: [String]) -> Void)?
    
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setUpNavigationButtons()
        setupTableView()
        title = "Select Media Type"
    }
    
    
    //MARK: - Initialization
    
    class func initializeFromStoryboard() -> SearchCategoryVC {
        
        let storyboard = UIStoryboard(name: Storyboards.SearchCategory, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: SearchCategoryVC.self)) as! SearchCategoryVC
    }
    
    
    // MARK: - Helper Methods
    
    func setupViewModel() {
        
        viewModel.popToViewController = { [weak self] in
            
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    
    // MARK: - Helper Methods
    
    func setUpNavigationButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonPressed))
    }
    
    
    // MARK: - Actions
    
    @objc func doneButtonPressed() {
        setSelectedCategories?(viewModel.selectedCategories)
        viewModel.popViewController()
    }
    
}
