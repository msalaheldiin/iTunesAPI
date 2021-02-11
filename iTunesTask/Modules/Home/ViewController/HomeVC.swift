//
//  HomeVC.swift
//  iTunesTask
//
//  Created by Mahmoud Salaheldin on 2/8/21.
//  Copyright © 2021 Mahmoud Salaheldin. All rights reserved.
//

import UIKit

class HomeVC: BaseViewController {
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var categoryLbl: UILabel!
    
    
    //MARK: - Variables
    
    lazy var viewModel = HomeViewModel()
    
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupViewModel()        
    }
    
    
    //MARK: - Initialization
    
    class func initializeFromStoryboard() -> HomeVC {
        
        let storyboard = UIStoryboard(name: Storyboards.Home, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: HomeVC.self)) as! HomeVC
    }
    
    
    // MARK: - Helper Methods
    
    func setupViewModel() {
        
        viewModel.navigateToViewController = { [weak self] (vc) in
            
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        viewModel.updateCategoryLbl = { [weak self] (selectedCategories) in
            
            self?.categoryLbl.text = selectedCategories
        }
        
        viewModel.showAlert = { [weak self] (title,message) in
            
            self?.alert(title: title, message: message)
        }
        
    }
    
    
    //MARK: - Actions
    
    @IBAction func selectCategoryButtonWasPressed(_ sender: Any) {
        
        viewModel.navigateToCategoryScreen()
    }
    
    @IBAction func submitButtonWasPressed(_ sender: Any) {
        
        viewModel.navigateToDetailsScreen(searchText: searchTF.text)
        
    }
    
}
