//
//  ViewController.swift
//  requestTest
//
//  Created by Sergey on 09.03.2020.
//  Copyright © 2020 Sergey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataDecode: [ServerAnswer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        oneRequest()
        
    }
    func oneRequest () {
        let url = URL(string: "https://reqres.in/api/users?page=2")!
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) {(data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                print(data)
                do {
                    let answer: ServerAnswer = try! JSONDecoder().decode(ServerAnswer.self, from: data)
                    self.dataDecode.append(answer)
                   print(answer)
                } catch {
                    print(error)
                }
            }
        }
    .resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           <#code#>
       }
    
}

struct ServerAnswer: Decodable {
let data: [User]
}

//struct ServerAnswer: Decodable {
//    let id: Int
//    let email: String
//    let first_name: String
 //   let last_name: String
//    let avatar: URL
    // name for protocol
 //   enum CodingKeys: String, CodingKey {
  //      case id
  //      case email
  //      case first_name
  //      case last_name
  //      case avatar
   // }
   // public struct Response {
   //     let data: [ServerAnswer]
        
   //     init(data: [ServerAnswer]) {
    //        self.data = data
    //    }
    //}
    // extension Response: Decodable {
        //enum ResponseKeys: String, CodingKey {
        //    case data
      //  }
    //}
         
//}

