//
//  ImageFromURL.swift
//  Famous Places
//
//  Created by Ivaylo Todorov on 4.11.17.
//  Copyright © 2017 Ivaylo Todorov. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    
    func setImageFromURl(stringImageUrl url: String){
        
        if let url = NSURL(string: url) {
            if let data = NSData(contentsOf: url as URL) {
                self.image = UIImage(data: data as Data)
            }
        }
    }
}
