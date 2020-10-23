//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var tenPctButton: UIButton!
    
    var numPeople: Double = 1.0
    var amount = 0.0
    var tipRate = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        twentyPctButton.isSelected = false
        tenPctButton.isSelected = false
        
        sender.isSelected = true
        
        // dismisses the keyboard
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numPeople = sender.value
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {

        if zeroPctButton.isSelected {
            tipRate = 0.0
        } else if tenPctButton.isSelected {
            tipRate = 0.1
        } else {
            tipRate = 0.2
        }
        
        let billTyped = billTextField.text!
        
        if billTyped == "" {
            amount = 0.0
        } else {
            amount = Double(billTyped)! * (1.0 + tipRate) / numPeople
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.numPeople = Int(numPeople)
            destinationVC.amount = amount
            destinationVC.tipRate = Int(tipRate * 100)
        }
    }
    
}

