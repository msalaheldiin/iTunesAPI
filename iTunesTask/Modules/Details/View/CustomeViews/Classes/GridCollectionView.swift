//
//  GridCollectionView.swift
//  iTunesTask
//
//  Created by Mahmoud Salaheldin on 2/10/21.
//  Copyright © 2021 Mahmoud Salaheldin. All rights reserved.
//

import UIKit

class GridCollectionViewCell: UITableViewCell {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - Variables
    
    var searchResults = [SearchResults]()
    
    
    // MARK: - init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    // MARK: - setup CollectionView
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerCell(cellClass: GridCell.self)
    }
    
    func setCollectionViewItemList(searchResults: [SearchResults]?) {
        self.searchResults = searchResults ?? []
        collectionView.reloadData()
    }
    
}


// MARK: - UICollectionViewDataSource

extension GridCollectionViewCell:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return searchResults.count > 0 ? searchResults.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let gridCell = collectionView.dequeue(indexPath: indexPath) as GridCell
        gridCell.configure(result:searchResults[indexPath.row])
        return gridCell
    }
}


// MARK: - UICollectionViewDelegate

extension GridCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: collectionViewWidth/3, height: collectionViewWidth/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}


