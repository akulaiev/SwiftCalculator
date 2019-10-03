//
//  ViewController.swift
//  APM
//
//  Created by Anna KULAIEVA on 10/3/19.
//  Copyright © 2019 Anna KULAIEVA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var picturesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        picturesCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "pictureCell")
        picturesCollectionView.delegate = self
        picturesCollectionView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pictureCell", for: indexPath) as! CustomCollectionViewCell
        cell.downloadedPicImageView.backgroundColor = .red
        return cell
    }
}
