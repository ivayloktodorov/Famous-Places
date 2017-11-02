//
//  MyPlacesViewController.swift
//  Famous Places
//
//  Created by Ivaylo Todorov on 31.10.17.
//  Copyright © 2017 Ivaylo Todorov. All rights reserved.
//

import UIKit

class MyPlacesViewController: UITableViewController {
    
    let isUserLoggedIn = UserDefaults.standard
    let myPosts = ["Post1", "Post2", "Post3"]
    var allUsersArray: Users = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let activeUser = isUserLoggedIn.string(forKey: "ActiveUserUsername")
////        let activePass = isUserLoggedIn.object(forKey:"ActiveUserPassword") as! String!
//print(activeUser)

    }
    
    
//    func activeUser() {
//        guard let username = self.activeUser else {
//            return
//        }
//        guard let password = self.activePass else {
//            return
//        }
//        for user in allUsersArray {
//            if user.username == username && user.password == password {

//
//                break
//            }
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPosts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        let posts = myPosts[indexPath.row]
        cell.customCellUsername.text = posts
        cell.customCellPost.text = posts
//        cell.customCellImage.image = posts
//        cell.customCellUserImage.image =

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        
        let stroyBoard = UIStoryboard(name:"Main", bundle: nil)
        let detailVC = stroyBoard.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
//        detailVC.desctiptionLabel.text =
//        detailVC.descriptionTextView.text =
//        detailVC.detailsImage.image =
        self.present(detailVC, animated: true, completion: nil)
    }
    

    
    func logOut() {
        isUserLoggedIn.removeObject(forKey: "isUserLoggedIn")
        isUserLoggedIn.removeObject(forKey: "ActiveUser")
        isUserLoggedIn.synchronize()
        let stroyBoard = UIStoryboard(name:"Main", bundle: nil)
        let myPlacesVC = stroyBoard.instantiateViewController(withIdentifier: "myPlacesVC") as! MyPlacesViewController
        self.present(myPlacesVC, animated: true, completion: nil)
    }
}
