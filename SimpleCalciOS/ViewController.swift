//
//  ViewController.swift
//  SimpleCalciOS
//
//  Created by Rachel Kipps on 10/22/15.
//  Copyright © 2015 Rachel Kipps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var inputArr: [String] = []
    
    @IBOutlet weak var display: UILabel!
    
    func addNumInput(str: String) {
        if display.text == "0" {
            display.text = str
        } else {
            display.text! += str
        }
    }
    
    func addSimpleOpInput(str: String) {
        inputArr.append(display.text!)
        inputArr.append(str)
        display.text = ""
    }
    
    @IBAction func pressNumButton(sender: UIButton!) {
        addNumInput(sender.titleLabel!.text!)
    }
    
    @IBAction func pressSimpleOpButton(sender: UIButton!) {
        addSimpleOpInput(sender.titleLabel!.text!)
    }
    
    
    
    @IBAction func pressEqualsButton(sender: UIButton!) {
        inputArr.append(display.text!)
        let op = inputArr[1]
        var result = 0
        switch op {
            case "avg":
               result = doAvg()
            case "count":
                result = doCount()
            case "fact":
                result = doFact()
            case "+", "-", "×", "÷", "%":
                result = doSimpleOp(op)
        default: break
        }
        display.text = "\(result)"
        inputArr.removeAll()
    }
    
        @IBAction func pressClearButton(sender: UIButton!) {
        display.text = "0"
        inputArr.removeAll()
    }
    
    func doSimpleOp(op: String) -> Int {
        let a = convert(inputArr[0])
        let b = convert(inputArr[2])
        var result = 0
        switch op {
        case "+":
            result = a + b
        case "-":
            result = a - b
        case "×":
            result = a * b
        case "÷":
            result = a / b
        case "%":
            result = a % b
        default: break
        }
        return result
    }
    
    func doAvg() -> Int {
        return 0
    }
    
    func doCount() -> Int {
        return 0
    }
    
    func doFact() -> Int {
        var result = 1
        for var i = 1; i <= convert(inputArr[0]); i++ {
            result *= i
        }
        return result
    }
    
    func convert(incoming:String) -> Int {
        return NSNumberFormatter().numberFromString(incoming)!.integerValue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

