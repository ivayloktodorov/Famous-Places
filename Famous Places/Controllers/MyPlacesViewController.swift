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
    var myPosts: NSArray = []
    var allUsersArray: Users = []
    var myUser = ""
    var myTitlePosts = ["test"]
    var myDescript = ["test"]
    var myImages = ["test"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTitlePosts = []
        myDescript = []
        myImages = []
        activeUserFunc()
    }
    
    func activeUserFunc() {
        let activeUserStr = isUserLoggedIn.string(forKey: "ActiveUserUsername")!
        let activePassStr = isUserLoggedIn.string(forKey: "ActiveUserPassword")!
        for user in allUsersArray {
            if user.username == activeUserStr && user.password == activePassStr {
                myPosts = (user.posts as NSArray)
                myUser = user.username
               
                for i in user.posts {
                    myTitlePosts.append(i.title)
                    myDescript.append(i.description)
                    myImages.append(i.urlImage)
                }
                break
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPosts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.customCellUsername.text = myUser
        cell.customCellPost.text = myTitlePosts[indexPath.row]
        let imgURL = myImages[indexPath.row]
        cell.customCellImage.setImageFromURl(stringImageUrl: imgURL)
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
       
//        if let postDictionary = myPosts[indexPath.row] as? [String:String] {
//            print(postDictionary)
//        }
//        if let testPostDict = myPosts[indexPath.row] as! Dictionary <String, String> {
//            print(testPostDict)
//        }
//        let thisPost = currentPost as! Dictionary [String: Any]
//        let currentPost = myPosts[indexPath.row]
        
        let stroyBoard = UIStoryboard(name:"Main", bundle: nil)
        let detailVC = stroyBoard.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        detailVC.descrLabel = myTitlePosts[indexPath.row]
        detailVC.descrTextView = myDescript[indexPath.row]
        detailVC.imageLink = myImages[indexPath.row]
        self.present(detailVC, animated: true, completion: nil)
    }
    
    
    func logOut() {
        isUserLoggedIn.removeObject(forKey: "isUserLoggedIn")
        isUserLoggedIn.removeObject(forKey: "ActiveUserUsername")
        isUserLoggedIn.removeObject(forKey: "ActiveUserPassword")
        isUserLoggedIn.synchronize()
        let stroyBoard = UIStoryboard(name:"Main", bundle: nil)
        let myPlacesVC = stroyBoard.instantiateViewController(withIdentifier: "myPlacesVC") as! MyPlacesViewController
        self.present(myPlacesVC, animated: true, completion: nil)
    }
}
