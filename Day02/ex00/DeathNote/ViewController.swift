//
//  ViewController.swift
//  DeathNote
//
//  Created by Anna KULAIEVA on 10/2/19.
//  Copyright © 2019 Anna KULAIEVA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var victims: [Victim] = [Victim(name: "Kenny", description: "All the possible reasons"), Victim(name: "Joffrey Baratheon", description: "Poison"), Victim(name: "Sean Bean's characters", description: "I've no idea, they just die in every movie")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return victims.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell")!
        let victim = victims[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = victim.name
        cell.detailTextLabel?.text = victim.description
        return cell
    }
}
