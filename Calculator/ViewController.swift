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
        case plus = 11, mult = 12, minus = 13, divide = 14
    }
    
    var leftOp: Int!
    var rightOp: Int!
    var operationNum: Int = 0
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
        if newNum == true || resultLabel.text == "0" {
            resultLabel.text = "\(sender.tag - 1)"
            newNum = false
        }
        else {
            resultLabel.text! += "\(sender.tag - 1)"
        }
        if let check = Int(resultLabel.text!) {
            if !(leftOp == nil) {
                rightOp = check
            }
        }
    }
   
    func resetParams() {
        leftOp = nil
        rightOp = nil
        newNum = true
        operationNum = 0
    }
    
    @IBAction func ACPressed(_ sender: UIButton) {
        resultLabel.text = "0"
        resetParams()
    }
    
    @IBAction func negPressed(_ sender: UIButton) {
        var safeRes = (partialValue: 0, overflow: false)
        if let res = resultLabel.text {
            if let check = Int(res) {
                safeRes = check.multipliedReportingOverflow(by: -1)
                if !safeRes.overflow {
                    resultLabel.text = "\(safeRes.partialValue)"
                }
                else {
                    resultLabel.text = "Error"
                }
            }
        }
    }
    
    func evaluateInput() {
        if let operation: Operations = ViewController.Operations(rawValue: operationNum) {
            if (leftOp != nil) && (rightOp != nil)
            {
                var error: Bool = false
                var safeRes = (partialValue: 0, overflow: false)
                switch operation {
                case .plus:
                    safeRes = leftOp!.addingReportingOverflow(rightOp!)
                case .minus:
                    safeRes = leftOp!.subtractingReportingOverflow(rightOp!)
                case .mult:
                    safeRes = leftOp!.multipliedReportingOverflow(by: rightOp!)
                case .divide:
                    safeRes = leftOp!.dividedReportingOverflow(by: rightOp!)
                }
                error = safeRes.overflow
                if !error {
                    leftOp = safeRes.partialValue
                    resultLabel.text = "\(leftOp!)"
                    rightOp = nil
                }
                else {
                    resultLabel.text = "Error"
                }
            }
        }
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        newNum = true
        if let check = Int(resultLabel.text!) {
            if !(leftOp != nil) {
                leftOp = check
            }
            if (leftOp != nil) && (rightOp != nil) && operationNum != 0 {
                evaluateInput()
            }
        }
        operationNum = sender.tag
    }

    @IBAction func equalPressed(sender: UIButton)
    {
        evaluateInput()
        resetParams()
    }
}
