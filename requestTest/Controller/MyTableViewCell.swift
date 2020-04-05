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
var email: UILabel! = UILabel()
var firstNameTable: UILabel! = UILabel()
var lastNameTable: UILabel! = UILabel()
var avatarTable: UIImageView! = UIImageView()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    let gap: CGFloat = 20
    let labelHeight: CGFloat = 20
    let labelWidth: CGFloat = 100
    
    firstNameTable = UILabel(frame: .init(x: gap, y: gap, width: labelWidth, height: labelHeight))
    lastNameTable = UILabel(frame: .init(x: gap * 5, y: gap, width: labelWidth, height: labelHeight))
        
    avatarTable.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
    avatarTable.translatesAutoresizingMaskIntoConstraints = false
        
    contentView.addSubview(firstNameTable)
    contentView.addSubview(lastNameTable)
    contentView.addSubview(avatarTable)
    constraintInit()
    }
    func constraintInit() {
        NSLayoutConstraint.activate(
            [avatarTable.topAnchor.constraint (equalTo: contentView.topAnchor, constant: 10),
            avatarTable.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            avatarTable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            //avatarTable.bottomAnchor.constraint(equalTo:
            avatarTable.heightAnchor.constraint(equalToConstant: 50),
            avatarTable.widthAnchor.constraint(equalToConstant: 50)
            
            
                
            ])
    }
    
}

