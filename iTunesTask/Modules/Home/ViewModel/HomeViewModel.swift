//
//  HomeViewModel.swift
//  iTunesTask
//
//  Created by Mahmoud Salaheldin on 2/8/21.
//  Copyright © 2021 Mahmoud Salaheldin. All rights reserved.
//

import Foundation
import UIKit

class HomeViewModel: BaseViewModel {
    
    
    // MARK: - Variables
    
    var navigateToViewController: ((_ vc: UIViewController) -> ())?
    var updateCategoryLbl: ((_ selectedCategories: String) -> ())?
    var showAlert: ((_ title: String,_ message: String) -> ())?
    var selectedCategories = [String]()
    
    
    //MARK: - Helper Methods
    
    func navigateToCategoryScreen() {
        
        let searchCategoryVC = SearchCategoryVC.initializeFromStoryboard()
        searchCategoryVC.setSelectedCategories = { [weak self]  selectedCategories in
            
            guard let self = self else { return }
            self.selectedCategories = selectedCategories
            self.updateCategoryLbl?(self.selectedCategories.joined(separator: ","))
        }
        navigateToViewController?(searchCategoryVC)
    }
    
    func validateNotEmpty(searchText: String?)-> Bool? {
        
        return !(searchText?.isEmpty ?? true) && (selectedCategories.count ) > 0
    }
    
    func navigateToDetailsScreen(searchText: String?) {
        
        if validateNotEmpty(searchText: searchText) ?? false {
            let detailsVC = DetailsVC.initializeFromStoryboard()
            detailsVC.setSearchParameters(searchText: searchText, categories: selectedCategories)
            navigateToViewController?(detailsVC)
            
        } else {
            showAlert?("Alert","Please enter a valid search keword and select at least one media type")
        }
    }
}
