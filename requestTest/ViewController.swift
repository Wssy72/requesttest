//
//  ViewController.swift
//  requestTest
//
//  Created by Sergey on 09.03.2020.
//  Copyright © 2020 Sergey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        oneRequest()
    }
    
    func oneRequest () {
        let url = URL(string: "https://reqres.in/api/users?page=2")!
        //var request = URLRequest(url: url)
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) {(data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                print(data)
                //let jsonDecoder = JSONDecoder()
                do {
                   // let json = try JSONSerialization.jsonObject as? [String: Any]
                  //  print(json)
                    
                    let product: User = try! JSONDecoder().decode(User.self, from: data)
                   print(product)
                } catch {
                    print(error)
                }
            }
        }
    .resume()
        
    }
}

struct User: Decodable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: URL
    // name for protocol
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case first_name
        case last_name
        case avatar
    }
    public struct Response {
        let data: [User]
        
        init(data: [User]) {
            self.data = data
        }
    }
    extension Response: Decodable {
        enum ResponseKeys: String, CodingKey {
            case data
        }
    }
         
}

