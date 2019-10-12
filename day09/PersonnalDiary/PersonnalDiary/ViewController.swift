//
//  ViewController.swift
//  Personnal Diary
//
//  Created by Yuriy Miedviediev on 10/11/19.
//  Copyright © 2019 Anna Kulaieva. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    let localAuthenticationContext = LAContext()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toArticlesDisplay") {
            let articlesDisplayVC = segue.destination as! ArticleTableViewController
        }
    }
    
    func authentificate() {
        var error: NSError?
        let loginStr = "You have to authenticate to use this Diary"
        if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            localAuthenticationContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: loginStr) { success, error in
                if success {
                    DispatchQueue.main.async {
                        print("ok!")
                        self.performSegue(withIdentifier: "toArticlesDisplay", sender: self)
                        return
                    }
                }
                else {
                    if let err = error {
                        print(err.localizedDescription)
//                        let alert = UIAlertController(title: "Error occured", message:"Try again", preferredStyle: .alert)
//                        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
//                            NSLog("The \"OK\" alert occured.")
//                        }))
//                        self.present(alert, animated: true, completion: nil)
                        self.authentificate()
                    }
                }
            }
        }
        else {
            if let err = error {
                print(err.localizedDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authentificate()
    }


}

