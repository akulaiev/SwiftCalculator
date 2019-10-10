//
//  TabBarDataVC.swift
//  Kanto
//
//  Created by Anna KULAIEVA on 10/8/19.
//  Copyright © 2019 Anna KULAIEVA. All rights reserved.
//

import UIKit

class TabBarDataVC: UITabBarController {

    var placesList: [Location] = [Location(title: "Unit Factory", latitude: 50.4687817, longitude: 30.4622611, color: .blue), Location(title: "42 Paris", latitude: 48.8966358, longitude: 2.31843371, color: .red), Location(title: "42 Fremont", latitude: 37.5486415, longitude: -122.0591528, color: .green), Location(title: "Saint-Ouen-Domprot", latitude: 48.6094218, longitude: 4.4080578, color: .purple), Location(title: "Grenoble", latitude: 45.1875602, longitude: 5.7357819, color: .yellow), Location(title: "Reims", latitude: 49.2577886, longitude: 4.031926, color: .cyan)]
    var placeNum: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        placeNum = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
