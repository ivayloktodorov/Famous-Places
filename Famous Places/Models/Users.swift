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
        
        init(username: String, password: String, userID: Int, email: String, phone: String, posts: Posts) {
            self.username = username
            self.password = password
            self.userID = userID
            self.email = email
            self.phone = phone
            self.posts = posts
        }
    }
    
    
    struct Post: Codable {
        let urlImage: String
        let title: String
        let description: String
        
        init(urlImage: String, title: String, description: String) {
            self.urlImage = urlImage
            self.title = title
            self.description = description
        }
    }
    

    }






