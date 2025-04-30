//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Chetan Shinde on 09/04/25.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var bmi: String?
    var advice: String?
    var color: UIColor?
    
    
    @IBOutlet weak var bmiValue: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiValue.text = bmi
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}
