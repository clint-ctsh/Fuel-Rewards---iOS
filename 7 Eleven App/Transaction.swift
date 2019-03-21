//
//  Transaction.swift
//  7 Eleven App
//
//  Created by MyMac on 3/14/19.
//  Copyright © 2019 Abdourahim Diallo. All rights reserved.
//

import Foundation

struct Transaction: Decodable {
    var id: Int
    var date:String
    var name: String
    var cardNumber: String
    var amount: Double
    
    /*
     id    6
     date    "2019-03-20"
     name    "Gas"
     amount    10.6
     cardNumber    "e64187ed-b153-4663-9058-16c5af8d7e74"
     */
    
////    enum codingKeys: String, CodingKey {
////        case name = "name"
////        case username = "username"
////        case email = "email"
////    }
////    
//    // Initializer
//    init(id: Int, name: String, username: String, email: String) {
//        self.id = id
//        self.name = name
//        self.username = username
//        self.email = email
//    }
}

