//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Donghee Lee on 2020/10/23.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var numPeople = 0
    var tipRate = 0
    var amount = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", amount)
        settingsLabel.text = "Split between \(numPeople) people, with \(tipRate)% tip."
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    


}
