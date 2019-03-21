//
//  SignupViewController.swift
//  7 Eleven App
//
//  Copyright © 2019 Abdourahim Diallo. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTxtOutlet: UITextField!
    @IBOutlet weak var loginBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func onLoginClick(_ sender: UIButton) {
        storeUserAfterLogin()
    }
    
    func storeUserAfterLogin() {
        
        // get email and whatever else from the login form
        let user = User(name: "John Doe", email: emailTxtOutlet.text!)
        
        do {
            // Here we store the user into the phone's memory.
            // This lets all the other app pages access the user's info.
            // You can do this after the user successfully logs in.\
            let encodedData: Data = try NSKeyedArchiver
                .archivedData(withRootObject: user, requiringSecureCoding: false)
            
            UserDefaults.standard.set(encodedData, forKey: "user")
        } catch {
            print(error)
        }
    }
    
    //TODO: use
    //Try populating login subsequent page with core data pulled info
    func retrieveUserFromStorage() {
        do {
            // Now, when we want to get an attribue from the User,
            // we can retrieve the object from memory.
            let decoded  = UserDefaults.standard.object(forKey: "user") as! Data
            let user = try NSKeyedUnarchiver
                .unarchiveTopLevelObjectWithData(decoded) as! User
            
            print("User with name " + user.name + " and email " + user.email)
        } catch {
            print(error)
        }
    }
}
