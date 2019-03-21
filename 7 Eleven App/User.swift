//
//  User.swift
//  Fuel Rewards
//
//  Created by Jared on 3/17/19.
//  Copyright © 2019 Cognizant. All rights reserved.
//
import Foundation

class User: NSObject, NSCoding {
    var name: String
    var email: String
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let email = aDecoder.decodeObject(forKey: "email") as! String
        self.init(name: name, email: email)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(email, forKey: "email")
    }
}
