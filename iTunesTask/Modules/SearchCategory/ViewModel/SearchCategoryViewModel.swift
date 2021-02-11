//
//  SearchCategoryViewModel.swift
//  iTunesTask
//
//  Created by Mahmoud Salaheldin on 2/8/21.
//  Copyright © 2021 Mahmoud Salaheldin. All rights reserved.
//

import Foundation

class SearchCategoryViewModel: BaseViewModel {
    
    
    // MARK: - Variables
    
    var popToViewController:(() -> Void)?
    let categoryItems = ["Album","Artist","Book","Movie","Music Video","Podcast","Song"]
    var selectedCategories = [String]()
    
    
    // MARK: - Helper Methods
    
    func numberOfItems()-> Int {
        
        return categoryItems.count
    }
    
    func category(atIndex index: Int) -> String {
        
        return categoryItems[index]
    }
    
    func addSelectedCategory(atIndex index: Int){
        
        selectedCategories.append(category(atIndex: index))
    }
    
    func removeSelectedCategory(atIndex index: Int) {
        
        if let categoryIndexToRemove = selectedCategories.firstIndex(of:category(atIndex: index)) {
            selectedCategories.remove(at: categoryIndexToRemove)
        }
    }
    
    func popViewController() {
        popToViewController?()
    }
    
}
