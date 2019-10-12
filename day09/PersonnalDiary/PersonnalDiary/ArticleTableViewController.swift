//
//  ArticleTableViewController.swift
//  PersonnalDiary
//
//  Created by Yuriy Miedviediev on 10/12/19.
//  Copyright © 2019 Anna Kulaieva. All rights reserved.
//

import UIKit

class ArticleTableViewController: UITableViewController {

    @IBOutlet weak var articleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("here!!!")
        articleTableView.delegate = self
        articleTableView.dataSource = self
        articleTableView.rowHeight = UITableView.automaticDimension
        articleTableView.estimatedRowHeight = 245
        articleTableView.register(MyTableViewCell.self, forCellReuseIdentifier: "myCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        articleTableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MyTableViewCell
        return cell
    }
    
}
