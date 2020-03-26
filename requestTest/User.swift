//
//  User.swift
//  requestTest
//
//  Created by Sergey on 26.03.2020.
//  Copyright © 2020 Sergey. All rights reserved.
//

import Foundation

struct User: Decodable {
   let id: Int
   let email: String
   let firstName: String
   let lastName: String
   let avatar: URL
    
enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

