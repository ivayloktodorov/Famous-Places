//
//  AlertHandler.swift
//  Famous Places
//
//  Created by Ivaylo Todorov on 31.10.17.
//  Copyright © 2017 Ivaylo Todorov. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func displayAlert(withTitle title: String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
            

        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
