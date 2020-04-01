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
       myTableView.register(MyTableViewCell.self, forCellReuseIdentifier: registerCell)
        
        view.backgroundColor = .white
        
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        view.addSubview(myTableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataDecode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: registerCell, for: indexPath) as! MyTableViewCell
        let userNumber = indexPath.row
        let user = dataDecode[userNumber]
        //print("\(dataDecode[userNumber])")
        cell.textLabel?.text = user.firstName
        //cell.lastNameTable?.text = 
        return cell
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
        print("request completed")
    }
    
}

struct ServerAnswer: Decodable {
    let data: [User]
}

