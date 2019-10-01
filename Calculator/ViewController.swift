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
    
    var operand: Int = 0
    var result: Int = 0
    var operation: Operations!
    
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
        if resultLabel.text == "0" || resultLabel.text == "Error" || result != 0 {
            resultLabel.text = "\(sender.tag - 1)"
        }
        else {
            resultLabel.text! += "\(sender.tag - 1)"
        }
    }
   
    @IBAction func ACPressed(_ sender: UIButton) {
        resultLabel.text = "0"
        result = 0
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
    
    func evaluateInput() {
        var error: Bool = false
        switch operation! {
        case .plus:
            result += operand
        case .minus:
            result -= operand
        case .mult:
            result *= operand
        case .divide:
            if (operand != 0) {
                result /= operand
            }
            else {
                error = true
            }
        }
        if error == false {
            resultLabel.text = "\(result)"
        }
        else {
            resultLabel.text = "Error"
        }
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        operation = ViewController.Operations(rawValue: sender.tag)!
        if let check = Int(resultLabel.text!) {
            result = check
        }
    }

    @IBAction func equalPressed(sender: UIButton)
    {
        if let check = Int(resultLabel.text!) {
            operand = check
        }
        evaluateInput()
        result = 0
        operand = 0
    }
}
