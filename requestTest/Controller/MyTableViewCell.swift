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
var avatar: UILabel! = UILabel()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    let gap: CGFloat = 20
    let labelHeight: CGFloat = 30
    let labelWidth: CGFloat = 150
    
    lastNameTable = UILabel(frame: .init(x: gap, y: gap, width: labelWidth, height: labelHeight))
    contentView.addSubview(lastNameTable)
    }
}

