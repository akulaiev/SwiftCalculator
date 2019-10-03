//
//  NotesViewController.swift
//  DeathNote
//
//  Created by Anna KULAIEVA on 10/2/19.
//  Copyright © 2019 Anna KULAIEVA. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var noteTableView: UITableView!
    var boundsView = UIView()
    var appDelegate = AppDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.victims.append(Victim(name: "Kenny", description: "All the possible reasons", date: "23.10.2019, 11:11"))
        appDelegate.victims.append(Victim(name: "Joffrey Baratheon", description: "Poison", date: "24.10.2019, 11:42"))
        appDelegate.victims.append(Victim(name: "Sean Bean's characters", description: "I've no idea, they just die in every movie", date: "25.10.2019, 24:42"))
        noteTableView.delegate = self
        noteTableView.rowHeight = UITableViewAutomaticDimension
        noteTableView.estimatedRowHeight = 175
        noteTableView.register(UINib.init(nibName: "NoteTableViewCell", bundle: nil), forCellReuseIdentifier: "NoteTableViewCell")
        self.boundsView.backgroundColor = UIColor.black
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        noteTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return appDelegate.victims.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 7
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 7
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return boundsView
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return boundsView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = noteTableView.dequeueReusableCell(withIdentifier: "NoteTableViewCell") as! NoteTableViewCell
        let victim = appDelegate.victims[(indexPath as NSIndexPath).section]
        cell.nameLabel.text = victim.name
        cell.descriptionLabel.text = victim.description
        cell.dateLabel.text = victim.date
        cell.backgroundImageView.image = UIImage(named: "paper")
        return cell
    }
}
