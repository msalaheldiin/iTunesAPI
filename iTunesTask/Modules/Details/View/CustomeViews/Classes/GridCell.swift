//
//  gridCellCollectionViewCell.swift
//  iTunesTask
//
//  Created by Mahmoud Salaheldin on 2/10/21.
//  Copyright © 2021 Mahmoud Salaheldin. All rights reserved.
//

import UIKit
import AlamofireImage

class GridCell: UICollectionViewCell {

    
    //MARK: - Outlets

    @IBOutlet weak var profileIV: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    //MARK: - init

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - Helper Methods
    
    func configure(result: SearchResults?) {
        
        if let imageUrlString = result?.artworkUrl100,
            let imageUrl = URL(string: imageUrlString) {
            profileIV.af.setImage(withURL: imageUrl)
        }
        titleLbl.text = result?.collectionCensoredName
    }
    

}
