//
//  ViewController.swift
//  requestTest
//
//  Created by Sergey on 09.03.2020.
//  Copyright © 2020 Sergey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataDecode = [User]()
    var myTableView: UITableView! = UITableView()
    let registerCell = "registerCells"
    var numberLabel: UILabel! = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        oneRequest()
        myTableView = UITableView.init(frame: view.bounds, style: UITableView.Style.grouped)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "registerCell")
        view.backgroundColor = .white
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        view.addSubview(myTableView)
        self.myTableView.reloadData()
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
                    let answerData = answer.data
                    self.dataDecode.append(contentsOf: answerData)
                    
                   print(answer)
                } catch {
                    print(error)
                }
            }
        }
    .resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return dataDecode.count
       }
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: registerCell, for: indexPath)
       let userNumber = indexPath.row
       let user = dataDecode[userNumber]
       cell.textLabel?.text = user.firstName
       return cell
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

