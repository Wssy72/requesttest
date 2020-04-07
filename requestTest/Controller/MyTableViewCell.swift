//
//  MyTableViewCell.swift
//  requestTest
//
//  Created by Sergey on 31.03.2020.
//  Copyright © 2020 Sergey. All rights reserved.
//

import Foundation
import UIKit

class MyTableViewCell: UITableViewCell {

var id: UILabel! = UILabel()
var firstNameTable: UILabel! = UILabel()
var lastNameTable: UILabel! = UILabel()
var avatarTable: UIImageView! = UIImageView()
var email: UILabel! = UILabel()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    let gap: CGFloat = 20
    let labelHeight: CGFloat = 20
    let labelWidth: CGFloat = 80
        
    id = UILabel(frame: .init(x: gap, y: gap, width: labelWidth, height: labelHeight))
    id.translatesAutoresizingMaskIntoConstraints = false
        
    firstNameTable = UILabel(frame: .init(x: 50, y: gap, width: labelWidth, height: labelHeight))
    firstNameTable.translatesAutoresizingMaskIntoConstraints = false
        
    lastNameTable = UILabel(frame: .init(x: gap * 5, y: gap, width: labelWidth, height: labelHeight))
    lastNameTable.translatesAutoresizingMaskIntoConstraints = false
    
    avatarTable.frame = CGRect(x: 10, y: 20, width: 50, height: 50)
    avatarTable.translatesAutoresizingMaskIntoConstraints = false
    avatarTable.clipsToBounds = false
    
    email = UILabel(frame: .init(x: gap, y: gap, width: labelWidth, height: labelHeight))
    email.translatesAutoresizingMaskIntoConstraints = false
        
    contentView.addSubview(id)
    //contentView.addSubview(firstNameTable)
    //contentView.addSubview(lastNameTable)
    contentView.addSubview(avatarTable)
    //contentView.addSubview(email)
    
    constraintInit()
    }
    func constraintInit() {
        NSLayoutConstraint.activate(
            [
            id.topAnchor.constraint (equalTo: contentView.topAnchor, constant: 10),
            id.leftAnchor.constraint(equalTo: avatarTable.rightAnchor, constant: 10),
            
            firstNameTable.leftAnchor.constraint(equalTo: avatarTable.rightAnchor, constant: 10),
            //firstNameTable.topAnchor.constraint (equalTo: contentView.topAnchor, constant: 10),
            //lastNameTable.leftAnchor.constraint (equalTo: firstNameTable.rightAnchor, constant: 10),
            //lastNameTable.topAnchor.constraint (equalTo: contentView.topAnchor, constant: 10),
            //lastNameTable.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                
            avatarTable.topAnchor.constraint (equalTo: contentView.topAnchor, constant: 10),
            avatarTable.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            avatarTable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            //avatarTable.heightAnchor.constraint(equalToConstant: 80),
            //avatarTable.widthAnchor.constraint(equalToConstant: 80)
            
            ])
    }
    
}

