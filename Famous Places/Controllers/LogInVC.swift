//
//  ViewController.swift
//  Famous Places
//
//  Created by Ivaylo Todorov on 31.10.17.
//  Copyright © 2017 Ivaylo Todorov. All rights reserved.
//

import UIKit

class LogInVC: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let isUserLoggedIn = UserDefaults.standard
    var allUsersArray: Users = []

    override func viewDidLoad() {
        super.viewDidLoad()
        readJSON()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if isUserLoggedIn.bool(forKey: "isUserLoggedIn") {
        changeVC()
        }
    }
    
    
    func logInFunc() {
        guard let username = self.usernameTextField.text else {
            return
        }
        guard let password = self.passwordTextField.text else {
            return
        }
        for user in allUsersArray {
            if user.username == username && user.password == password {
                isUserLoggedIn.set(true, forKey: "isUserLoggedIn")
                isUserLoggedIn.set(username, forKey: "ActiveUserUsername")
                isUserLoggedIn.set(password, forKey: "ActiveUserPassword")
                isUserLoggedIn.synchronize()
                changeVC()
                break
            }
        }
    }
    
    
    @IBAction func signInButton(_ sender: Any) {
        if isUsernameValid(usernameTextField.text!) && isPasswordValid(passwordTextField.text!){
            logInFunc()
            
        } else {

            displayAlert(withTitle: "Username or password is not correct. Please try again.", message: "")
            usernameTextField.text = ""
            passwordTextField.text = ""
        }
    }

    func changeVC() {
        let stroyBoard = UIStoryboard(name:"Main", bundle: nil)
        let myPlacesVC = stroyBoard.instantiateViewController(withIdentifier: "myPlacesVC") as! MyPlacesViewController
        myPlacesVC.allUsersArray = allUsersArray
        self.present(myPlacesVC, animated: true, completion: nil)
    }
    
    func readJSON() {
        guard let file = Bundle.main.url(forResource: "Users", withExtension: "json") else {
            print("no file")
            return
        }
        
        do {
            let jsonData = try Data(contentsOf: file)
            let jsonDecoder = JSONDecoder()
            let users = try jsonDecoder.decode(Users.self, from: jsonData)
            self.allUsersArray = users
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func isUsernameValid(_ username : String) -> Bool {
        let RegEx = "\\A\\w{1,18}\\z"
//        let RegEx = "/[a-zA-Z]+/g"
        let predicate = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return predicate.evaluate(with: username)
    }

    func isPasswordValid(_ password : String) -> Bool{
        let RegEx = "\\A\\w{6,12}\\z"
        let predicate = NSPredicate(format: "SELF MATCHES %@", RegEx)
        return predicate.evaluate(with: password)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
}
