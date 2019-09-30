//
//  ViewController.swift
//  Calculator
//
//  Created by Anna KULAIEVA on 9/30/19.
//  Copyright © 2019 Anna KULAIEVA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButon: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var ACButton: UIButton!
    @IBOutlet weak var NEGButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var multButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var equalsButton: UIButton!
    
    enum Operations: Int {
        case plus = 11, mult = 12, minus = 13, divide = 14, equals = 15
    }
    
    var firstVal: Int = 0
    var secondVal: Int = 0
    var result: Int = 0
    var operation: Operations!
    var newNum: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oneButton.layer.cornerRadius = 13
        twoButon.layer.cornerRadius = 13
        threeButton.layer.cornerRadius = 13
        fourButton.layer.cornerRadius = 13
        fiveButton.layer.cornerRadius = 13
        sixButton.layer.cornerRadius = 13
        sevenButton.layer.cornerRadius = 13
        eightButton.layer.cornerRadius = 13
        nineButton.layer.cornerRadius = 13
        zeroButton.layer.cornerRadius = 13
        ACButton.layer.cornerRadius = 13
        NEGButton.layer.cornerRadius = 13
        plusButton.layer.cornerRadius = 13
        multButton.layer.cornerRadius = 13
        minusButton.layer.cornerRadius = 13
        divideButton.layer.cornerRadius = 13
        equalsButton.layer.cornerRadius = 13
    }

    @IBAction func updateResLabel(_ sender: UIButton) {
        if newNum == true {
            resultLabel.text = "\(sender.tag - 1)"
            newNum = false
        }
        else {
            if let check = Int(resultLabel.text!)
            {
                firstVal = check
            }
            resultLabel.text! += "\(sender.tag - 1)"
            if let check = Int(resultLabel.text!)
            {
                secondVal = check
            }
        }
    }
   
    @IBAction func ACPressed(_ sender: UIButton) {
        resultLabel.text = "0"
        firstVal = 0
        newNum = true
    }
    
    @IBAction func negPressed(_ sender: UIButton) {
        var tmpRes: Int = 0
        if let res = resultLabel.text {
            if let check = Int(res) {
                tmpRes = check * -1
                resultLabel.text = "\(tmpRes)"
            }
        }
    }
    
    func resetData() {
        
    }
    
    func evaluateInput() {
        var error: Bool = false
        switch operation! {
        case .plus:
            result = firstVal + secondVal
        case .minus:
            result = firstVal - secondVal
        case .mult:
            result = firstVal * secondVal
        case .divide:
            if (secondVal != 0) {
                result = firstVal / secondVal
            }
            else {
                error = true
            }
        case .equals:
            newNum = true
        }
        if error == false {
            resultLabel.text = "\(result)"
        }
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        newNum = true
        operation = ViewController.Operations(rawValue: sender.tag)!
        print("first: \(firstVal), second: \(secondVal)")
        evaluateInput()
    }

}
