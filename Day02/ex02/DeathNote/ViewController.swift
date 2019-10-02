//
//  ViewController.swift
//  DeathNote
//
//  Created by Anna KULAIEVA on 10/2/19.
//  Copyright © 2019 Anna KULAIEVA. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var noteTableView: UITableView!
    var victims: [Victim] = [Victim(name: "Kenny", description: "All the possible reasons"), Victim(name: "Joffrey Baratheon", description: "Poison"), Victim(name: "Sean Bean's characters", description: "I've no idea, they just die in every movie"), ]
    var rowHeight: CGFloat = 0
    var boundsView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rowHeight = noteTableView.bounds.height / CGFloat(victims.count) - 50
        print(rowHeight)
        self.boundsView.backgroundColor = UIColor.black
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return victims.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return boundsView
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return boundsView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = noteTableView.dequeueReusableCell(withIdentifier: "noteCell") as! NoteTableViewCell
        let victim = victims[(indexPath as NSIndexPath).section]
        cell.nameLabel.text = victim.name
        cell.descriptionLabel.text = victim.description
        return cell
    }
}
