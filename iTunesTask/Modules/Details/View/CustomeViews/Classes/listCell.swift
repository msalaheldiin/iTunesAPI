//
//  listCell.swift
//  iTunesTask
//
//  Created by Mahmoud Salaheldin on 2/10/21.
//  Copyright © 2021 Mahmoud Salaheldin. All rights reserved.
//

import UIKit
import AlamofireImage

class listCell: UITableViewCell {
    
    
    //MARK: - View Life Cycle
    
    @IBOutlet weak var profielIV: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    //MARK: - Helper Methods
    
    func configurelistCell(result: SearchResults?) {
        
        if let imageUrlString = result?.artworkUrl100,
            let imageUrl = URL(string: imageUrlString) {
            profielIV.af.setImage(withURL: imageUrl)
        }
        titleLbl.text = result?.collectionCensoredName
        authorLbl.text = result?.trackName
    }
    
}
