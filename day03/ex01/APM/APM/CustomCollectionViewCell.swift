//
//  CustomCollectionViewCell.swift
//  APM
//
//  Created by Yuriy Miedviediev on 10/4/19.
//  Copyright © 2019 Anna KULAIEVA. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var progress: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
