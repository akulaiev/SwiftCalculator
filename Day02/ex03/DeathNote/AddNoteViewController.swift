//
//  AddNoteViewController.swift
//  DeathNote
//
//  Created by Anna Kulaieva on 10/2/19.
//  Copyright © 2019 Anna KULAIEVA. All rights reserved.
//

import Foundation
import UIKit

class AddNoteViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailsTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var newNote: Victim = Victim(name: "", description: "", date: "")
    var appDelegate = AppDelegate()
    var gotName: Bool = false
    var gotDescription: Bool = false
    var gotDate: Bool = false
 
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.minimumDate = Date()
        nameTextField.delegate = self
        detailsTextField.delegate = self
        appDelegate = UIApplication.shared.delegate as! AppDelegate
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
        if textField.tag == 1 {
            newNote.name = ""
            gotName = false
        }
        else if textField.tag == 2 {
            gotDescription = false
            newNote.description = ""
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text! != "" {
            if textField.tag == 1 {
                newNote.name = textField.text!
                gotName = true
            }
            else if textField.tag == 2 {
                gotDescription = true
                newNote.description = textField.text!
            }
        }
    }

    @IBAction func okPressed(_ sender: UIButton) {
        gotDate = true
        let date = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.mm.yyyy, hh:mm"
        newNote.date = dateFormatter.string(from: date)
    }
    
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        if gotName && gotDate {
            if !gotDescription {
                newNote.description = ""
            }
            appDelegate.victims.append(newNote)
            print("name: \(appDelegate.victims.last!.name), description: \(appDelegate.victims.last!.description), date: \(appDelegate.victims.last!.date).")
            print("name: \(newNote.name), description: \(newNote.description), date: \(newNote.date).")
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
}
