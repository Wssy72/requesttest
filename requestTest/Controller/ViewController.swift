//
//  ViewController.swift
//  requestTest
//
//  Created by Sergey on 09.03.2020.
//  Copyright © 2020 Sergey. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataDecode = [User]()
    var myTableView: UITableView! = UITableView()
    let registerCell = "registerCells"
    var numberLabel: UILabel! = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myTableView = UITableView.init(frame: view.bounds, style: UITableView.Style.grouped)
       myTableView.register(MyTableViewCell.self, forCellReuseIdentifier: registerCell)
        
        view.backgroundColor = .white
        myTableView.rowHeight = UITableView.automaticDimension
        myTableView.estimatedRowHeight = 44.0
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        view.addSubview(myTableView)
        print("tableview на экране")
        oneRequest()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("tableview спросил, сколько у нас будет ячеек, смотрим:", dataDecode.count)
        return dataDecode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: registerCell, for: indexPath) as! MyTableViewCell
        let userNumber = indexPath.row
        let user = dataDecode[userNumber]
        
        let urlImage = user.avatar
        let url = URL(string: "\(urlImage)")
        cell.avatarTable.kf.setImage(with: url)
        
        //DispatchQueue.global().async {
        //let dataUrl = try? Data(contentsOf: user.avatar)
        //    DispatchQueue.main.async {
        //cell.avatarTable.image = UIImage(data: dataUrl!)
        //}
        //}
        cell.idName.text = "id:"
        cell.id.text = String(user.id)
        cell.firstNameTable.text = user.firstName
        //cell.lastNameTable.text = user.lastName
        //cell.email.text = user.email
        
        return cell
        
    }
    
    //func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> //CGFloat {
        //   return UITableView.automaticDimension
       //}
    
    func oneRequest () {
        print("создаем запрос")
        let url = URL(string: "https://reqres.in/api/users?page=2")!
        let session = URLSession.shared
        let task = session.dataTask(with: url) {(data, response, error) in
            print("запрос получен")
            if let response = response {
                print(response)
            }
            if let data = data {
                print(data)
                do {
                    let answer: ServerAnswer = try! JSONDecoder().decode(ServerAnswer.self, from: data)
                    let answerData = answer.data
                    self.dataDecode.append(contentsOf: answerData)
                    DispatchQueue.main.async {
                        print("просим tableview перезагрузить данные")
                        self.myTableView.reloadData()
                    }
                    print(answer)
                } catch {
                    print(error)
                }
            }
        }
        .resume()
        print("запрос отправлен")
    }
}

struct ServerAnswer: Decodable {
    let data: [User]
}

