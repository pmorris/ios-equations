//
//  ViewController.swift
//  Math Equations
//
//  Created by Phil Morris on 3/2/17.
//  Copyright © 2017 Philip I Morris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var display: UILabel!
    var userIsTyping = false
    var equationSectionCount = 0
    
    var displayValue: String {
        get {
            return display.text!
        }
        set {
            display.text! = String(newValue)!
        }
    }

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsTyping {
            let textCurrentlyInDisplay = displayValue
            displayValue = textCurrentlyInDisplay + digit
        } else {
            displayValue = digit
            equationSectionCount += 1
            userIsTyping = true
        }

    }
    
    @IBAction func touchOperation(_ sender: UIButton) {
        if userIsTyping {
            let symbol = sender.currentTitle!
            if symbol == "=" {
                equationSectionCount += 1
            }
            displayValue = displayValue + " " + symbol
        }
    }
    
    
    @IBAction func touchClear(_ sender: UIButton) {
        userIsTyping = false
        equationSectionCount = 0
        display.text = ""
    }
    
}

