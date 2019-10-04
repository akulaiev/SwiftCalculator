//
//  ViewController.swift
//  APM
//
//  Created by Anna KULAIEVA on 10/3/19.
//  Copyright © 2019 Anna KULAIEVA. All rights reserved.
//

import UIKit

extension UIImageView {
    public func asyncLoadImage (urlStr: String) {
        if let url = NSURL(string: urlStr) {
            let request = NSURLRequest(url: url as URL)
            URLSession.sharedSession.dataTaskWithURL(with: request, completionHandler: { (data, response, error) -> Void in
                if error == nil {
                DispatchQueue.main.async {
                    self.image = placeHolder
                }
                return
            }
            DispatchQueue.main.async {
                if let data = data {
                    if let downloadedImage = UIImage(data: data) {
                    imageCache.setObject(downloadedImage, forKey: NSString(string: URLString))
                    self.image = downloadedImage
                    }
                }
            }
            }).resume()
        }
    }
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var picturesCollectionView: UICollectionView!
    let urls: [String] = ["https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/iss060e080405_large.jpg", "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/pia18284-1600x1200.jpg", "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/pia23454.jpg", "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/westernhemisphere_geos_2019246_lrg.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        picturesCollectionView.delegate = self
        picturesCollectionView.dataSource = self
        picturesCollectionView.register(UINib.init(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "pictureCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsNum: CGFloat = 2
        let borderSpace: CGFloat = 5
        let totalSpace = (2 * borderSpace) + (itemsNum - 1)
        let width = (collectionView.bounds.width - totalSpace) / itemsNum
        return CGSize(width: width, height: width - 13)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pictureCell", for: indexPath) as! CustomCollectionViewCell
        let url = URL(string: urls[(indexPath as NSIndexPath).row])
        if let data = try? Data(contentsOf: url!) {
            cell.pictureImageView.image = UIImage(data: data)
        }
        return cell
    }
}
