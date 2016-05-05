//
//  ViewController.swift
//  Calculator
//
//  Created by Daniel on 5/3/16.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!

    private var userInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
            
        } else {
            display.text = digit
        }
        userInTheMiddleOfTyping = true
    }
    private var displayValue: Double {
        
        get {
            return Double(display.text!)!
        }
        
        set {
            display.text = String(newValue)
        }
        
        
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(sender: UIButton) {
        if userInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        
        displayValue = brain.result
        
    }

}

