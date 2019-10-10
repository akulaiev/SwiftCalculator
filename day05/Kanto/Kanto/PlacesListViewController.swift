//
//  PlacesListViewController.swift
//  Kanto
//
//  Created by Anna KULAIEVA on 10/8/19.
//  Copyright © 2019 Anna KULAIEVA. All rights reserved.
//

import Foundation
import UIKit

class PlacesListViewController: ViewController, UITableViewDelegate, UITableViewDataSource {

    var placesList: [Location]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placesList = (self.tabBarController as! TabBarDataVC).placesList
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placesListCell")!
        cell.textLabel?.text = placesList[(indexPath as NSIndexPath).row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tabBarVC: TabBarDataVC = self.tabBarController as! TabBarDataVC
        tabBarVC.placeNum = indexPath.row
        let mapViewController = self.tabBarController?.viewControllers![1] as! MapViewController;
        tabBarVC.selectedViewController = mapViewController
    }
}
