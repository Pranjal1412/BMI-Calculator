//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var calculate = CalculatorBrain()
    var answer = 0.0
    
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBAction func heightChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightValue.text = "\(height)m"
    }
    
    @IBAction func weightChanged(_ sender: UISlider) {
        let weight = String(Int(sender.value))
        weightValue.text = "\(weight)kg"
        //weightValue.text = String(format: "%.0f", sender.value)
    }
        
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        answer = calculate.bmiValue(heightSlider.value, weightSlider.value)
        
        //this allow to perform the segue that has been set and changes the screen
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    //now to pass the value to ResultViewController, we override the func prepare
    //prepare is a method of UIViewContoller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //checks if the VC is the one we want
        if segue.identifier == "goToResults"{
            //here segue.destination is the viewController that will be initialized
            //when the segue is performed
            //segue.destination data type --> UIViewContoller hence destinationVC --> UIViewController
            let destinationVC = segue.destination as! ResultViewController
            
            //as! ResultViewController changes the data type of destinationVC --> ResultViewController
            //we can say destinationVC is an obj of ResultViewController
            destinationVC.bmi = String(format: "%0.1f", answer)
            destinationVC.advice = calculate.getAdvice()
            destinationVC.color = calculate.getColor()
        }
    }
    
}

