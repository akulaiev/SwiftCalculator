//
//  ViewController.swift
//  akulaiev2019
//
//  Created by akulaiev on 10/11/2019.
//  Copyright (c) 2019 akulaiev. All rights reserved.
//

import UIKit
import akulaiev2019

class ViewController: UIViewController {
    var am: ArticleManager = ArticleManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        let art1: Article? = am.newArticle()
        art1?.title = "hi"
        print(art1!.title!)
        let art2: Article? = am.newArticle()
        art2?.title = "it's"
        print(art2!.title!)
        let art3: Article? = am.newArticle()
        art3?.title = "test"
        print(art3!.title!)
        am.save()
        let allArts = am.getAllArticles()
        for art in allArts {
            print(art.title!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

