//
//  AddNoteViewController.swift
//  DeathNote
//
//  Created by Anna Kulaieva on 10/2/19.
//  Copyright © 2019 Anna KULAIEVA. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }

    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
}

class AddNoteViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailsTextView: UITextView!
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
        detailsTextView.delegate = self
        detailsTextView.layer.borderWidth = 0.8
        detailsTextView.layer.borderColor = UIColor.black.cgColor
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        self.setupHideKeyboardOnTap()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        detailsTextView.textColor = UIColor.darkGray
        detailsTextView.text = "Enter description"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
        newNote.name = ""
        gotName = false
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = UIColor.black
        newNote.description = ""
        gotDescription = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text! != "" {
            newNote.name = textField.text!
            gotName = true
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text! != "" {
            newNote.description = textView.text!
            gotDescription = true
        }
    }

    @IBAction func changedDateValue(_ sender: UIDatePicker) {
        gotDate = true
        let date = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.mm.yyyy, hh:mm"
        newNote.date = dateFormatter.string(from: date)
    }
    
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        if gotName {
            if !gotDescription {
                newNote.description = ""
            }
            if !gotDate {
                let date = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd.mm.yyyy, hh:mm"
                newNote.date = dateFormatter.string(from: date)
            }
            appDelegate.victims.append(newNote)
            print("name: \(appDelegate.victims.last!.name), description: \(appDelegate.victims.last!.description), date: \(appDelegate.victims.last!.date).")
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
}
