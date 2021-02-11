//
//  searchCategoryVC+TableView.swift
//  iTunesTask
//
//  Created by Mahmoud Salaheldin on 2/8/21.
//  Copyright © 2021 Mahmoud Salaheldin. All rights reserved.
//

import Foundation
import UIKit

extension SearchCategoryVC {
    
    // MARK: - setupTableViewView
    
    func setupTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsMultipleSelection = true
        tableView.registerCellNib(cellClass: CategoryCell.self)
        
    }
}


// MARK: - UITableViewDataSource

extension SearchCategoryVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let categoryCell = tableView.dequeue() as CategoryCell
        categoryCell.textLabel?.text = viewModel.category(atIndex: indexPath.row)
        return categoryCell
    }
}


// MARK: - UITableViewDelegate

extension SearchCategoryVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel.addSelectedCategory(atIndex: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        viewModel.removeSelectedCategory(atIndex: indexPath.row)
    }
}
