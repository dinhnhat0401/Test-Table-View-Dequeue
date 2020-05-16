//
//  TestTableViewCell.swift
//  TestTableViewDequeue
//
//  Created by Đinh Văn Nhật on 2020/05/16.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {
    static var count = 1
    static let identifier = "TestTableViewCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .green
        print("init with style is called \(TestTableViewCell.count) times")
        TestTableViewCell.count += 1
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("init with CODER is called \(TestTableViewCell.count) times")
        TestTableViewCell.count += 1
        self.backgroundColor = .blue
    }
}
