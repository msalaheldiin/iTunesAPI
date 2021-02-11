//
//  DetailsViewModel.swift
//  iTunesTask
//
//  Created by Mahmoud Salaheldin on 2/8/21.
//  Copyright © 2021 Mahmoud Salaheldin. All rights reserved.
//

import Foundation

class DetailsViewModel: BaseViewModel {
    
    
    // MARK: - Variables
    
    lazy var service = DetailsService()
    var reloadTableView: (() -> ())?
    var showLoadingIndicator: (() -> ())?
    var hideLoadingIndicator: (() -> ())?
    var showAlert: ((_ title: String,_ message: String) -> ())?
    var searchResults: [SearchResults?]?
    var searchText: String?
    var categories: [String]?
    var numberOfSections = 1
    var gridViewNumberOfCells = 1
    
    
    // MARK: - Network Calls
    
    func getSearchResult() {
        showLoadingIndicator?()
        service.getSearchResult(term: searchText, entity: categories,  success: { [weak self] (response) in
            guard let self = self else {return}
            guard let responseArray = response as? [Any?] else { return }
            self.searchResults = responseArray.map { SearchResults(from: $0) }
            if (self.searchResults?.count ?? 0) > 0 {
                self.reloadTableView?()
            }
            else {
                self.showEmptyAlert()
            }
            self.hideLoadingIndicator?()
            
            },
                                failure: { (response, erorr) in
                                    SnackBar.showMessage(erorr?.localizedDescription)
                                    self.hideLoadingIndicator?()
        })
    }
    
    
    // MARK: - Helper Methods
    
    func numberOfItems()-> Int {
        return searchResults?.count ?? 0
    }
    
    func item(atIndex index: Int) -> SearchResults? {
        return searchResults?[index]
    }
    
    func showEmptyAlert() {
        
        showAlert?("Alert","No search result available for the provided search query,please try again")
        
    }
}
