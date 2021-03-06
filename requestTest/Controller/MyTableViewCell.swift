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

var avatarTable = UIImageView()
var id: UILabel! = UILabel()
var idName: UILabel! = UILabel()
var firstNameTable: UILabel! = UILabel()
var lastNameTable: UILabel! = UILabel()
var email: UILabel! = UILabel()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    let gap: CGFloat = 20
    let labelHeight: CGFloat = 20
    let labelWidth: CGFloat = 80
        
//    avatarTable.frame = CGRect(x: 20, y: 30, width: 120, height: 120)
    avatarTable.translatesAutoresizingMaskIntoConstraints = false
    //avatarTable.clipsToBounds = false
    id = UILabel(frame: .init(x: gap, y: gap, width: labelWidth, height: labelHeight))
    id.translatesAutoresizingMaskIntoConstraints = false
        
    idName = UILabel(frame: .init(x: 0, y: 0, width: labelWidth, height: labelHeight))
    idName.translatesAutoresizingMaskIntoConstraints = false
        
    firstNameTable = UILabel(frame: .init(x: 0, y: 0, width: labelWidth, height: labelHeight))
    firstNameTable.translatesAutoresizingMaskIntoConstraints = false
        
    lastNameTable = UILabel(frame: .init(x: gap * 5, y: gap, width: labelWidth, height: labelHeight))
    lastNameTable.translatesAutoresizingMaskIntoConstraints = false
    
    email = UILabel(frame: .init(x: gap, y: gap, width: labelWidth, height: labelHeight))
    email.translatesAutoresizingMaskIntoConstraints = false
    
    contentView.addSubview(avatarTable)
    contentView.addSubview(idName)
    contentView.addSubview(id)
    contentView.addSubview(firstNameTable)
    contentView.addSubview(lastNameTable)
    contentView.addSubview(email)

    constraintInit()
    }
    func constraintInit() {
        NSLayoutConstraint.activate(
            [
            avatarTable.topAnchor.constraint (equalTo: contentView.topAnchor, constant: 10),
            avatarTable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            //contentView.bottomAnchor.constraint(equalTo: avatarTable.bottomAnchor, constant: 10),
                
            avatarTable.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            idName.topAnchor.constraint (equalTo: contentView.topAnchor, constant: 10),
            idName.leftAnchor.constraint(equalTo: avatarTable.rightAnchor, constant: 10),
                
            id.topAnchor.constraint (equalTo: contentView.topAnchor, constant: 10),
            id.leftAnchor.constraint(equalTo: idName.rightAnchor, constant: 5),
            
            firstNameTable.leftAnchor.constraint(equalTo: avatarTable.rightAnchor, constant: 10),
            firstNameTable.topAnchor.constraint (equalTo: id.bottomAnchor, constant: 10),
            
            lastNameTable.leftAnchor.constraint (equalTo: firstNameTable.rightAnchor, constant: 10),
            lastNameTable.topAnchor.constraint (equalTo: contentView.topAnchor, constant: 40),
            //lastNameTable.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            email.leftAnchor.constraint(equalTo: avatarTable.rightAnchor, constant: 10),
            email.topAnchor.constraint(equalTo: firstNameTable.bottomAnchor, constant: 10)
            ])
    }
    
}

