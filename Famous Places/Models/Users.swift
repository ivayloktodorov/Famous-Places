//
//  Users.swift
//  Famous Places
//
//  Created by Ivaylo Todorov on 31.10.17.
//  Copyright © 2017 Ivaylo Todorov. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    typealias Users = [User]
    typealias Posts = [Post]
    
    struct User: Codable {
        let password: String
        let posts: Posts
        let email: String
        let phone: String
        let userID: Int
        let username: String
    }
    
    
    struct Post: Codable {
        let urlImage: String
        let title: String
        let description: String
    }
    

    }






