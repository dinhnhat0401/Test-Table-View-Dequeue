//
//  TestTableViewController.swift
//  TestTableViewDequeue
//
//  Created by Đinh Văn Nhật on 2020/05/16.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import UIKit

class TestTableViewController: UITableViewController {
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TestTableViewCell.identifier,
            for: indexPath) as! TestTableViewCell
        return cell
    }

    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10.0
    }
}
