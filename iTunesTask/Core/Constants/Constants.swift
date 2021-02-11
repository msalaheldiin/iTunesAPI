//
//  Constants.swift
//  iTunesTask
//
//  Created by Mahmoud Salaheldin on  02/08/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//

import Foundation
import UIKit


//MARK:- APIS

enum API {
    
    static let search = "search"
    
}


//MARK:- Storyboards

enum Storyboards {
    
    static let Home = "Home"
    static let SearchCategory = "SearchCategory"
    static let Details = "Details"
}


//MARK:- Segment Control States

enum SegmentStates: Int , CaseIterable {
    
    case grid
    case list
}


//MARK:- TableView

enum TableViewCellHeight {
    static let collectionViewHeight: CGFloat = 500
}
