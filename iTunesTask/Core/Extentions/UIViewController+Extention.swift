//
//  UIViewController+Extention.swift
//  iTunesTask
//
//  Created by Mahmoud Salaheldin on 2/10/21.
//  Copyright © 2021 Mahmoud Salaheldin. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func alert(title: String, message: String) {
        let actionSheetController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        actionSheetController.addAction(cancelAction)
        present(actionSheetController, animated: true, completion: nil)
    }
}
