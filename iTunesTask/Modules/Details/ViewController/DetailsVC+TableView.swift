//
//  DetailsVC+TableView.swift
//  iTunesTask
//
//  Created by Mahmoud Salaheldin on 2/8/21.
//  Copyright © 2021 Mahmoud Salaheldin. All rights reserved.
//

import Foundation

import UIKit

extension DetailsVC {
    
    // MARK: - setupTableViewView
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCellNib(cellClass: listCell.self)
        tableView.registerCellNib(cellClass: GridCollectionViewCell.self)
    }
}


// MARK: - UITableViewDataSource

extension DetailsVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
           return viewModel.numberOfSections
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let selectedSegmentIndex = segmentControl.selectedSegmentIndex
        switch selectedSegmentIndex {
            
        case SegmentStates.list.rawValue:
            return viewModel.numberOfItems()
            
        case SegmentStates.grid.rawValue:
            return viewModel.gridViewNumberOfCells
            
        default:
            return viewModel.gridViewNumberOfCells
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = viewModel.item(atIndex: indexPath.row)
        let selectedSegmentIndex = segmentControl.selectedSegmentIndex
        switch selectedSegmentIndex {
            
        case SegmentStates.list.rawValue:
            
            let listCell = tableView.dequeue() as listCell
            listCell.configurelistCell(result: item)
            return listCell
            
        case SegmentStates.grid.rawValue:
            
            let gridCollectionViewCell = tableView.dequeue() as GridCollectionViewCell
            gridCollectionViewCell.setCollectionViewItemList(searchResults: viewModel.searchResults as? [SearchResults])
            return gridCollectionViewCell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let item = viewModel.item(atIndex: section)
         return item?.kind
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let selectedSegmentIndex = segmentControl.selectedSegmentIndex
        switch selectedSegmentIndex {
            
        case SegmentStates.list.rawValue:
            return UITableView.automaticDimension
            
        case SegmentStates.grid.rawValue:
            return TableViewCellHeight.collectionViewHeight
            
        default:
            return UITableView.automaticDimension
        }
    }
}

// MARK: - UITableViewDelegate

extension DetailsVC: UITableViewDelegate {}

