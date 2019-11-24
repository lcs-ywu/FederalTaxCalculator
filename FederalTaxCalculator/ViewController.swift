//
//  ViewController.swift
//  FederalTaxCalculator
//
//  Created by James Wu on 2019-11-21.
//  Copyright © 2019 James Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    // Outlets, constants, and variables defined here will be available for use anywhere below.

    @IBOutlet weak var userNameInput: UITextField!
    
    @IBOutlet weak var incomeInput: UITextField!
    
    @IBOutlet weak var taxOutput: UILabel!
    
    @IBOutlet weak var effectiveTaxRate: UILabel!
    
    // MARK: Methods
    // This method runs once when the view is loaded.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTaxOwing(_ sender: Any) {
        
        //clear out the output label from tge last time the  button was pressed
        taxOutput.text = ""
        effectiveTaxRate.text = ""
        
        // Done editing, so hide the keyboard
        view.endEditing(true)
        
        guard let nameInputAsString = userNameInput.text,nameInputAsString.count > 0 else{
           taxOutput.text = "Please enter your name."
            return
        }
        guard let incomeInputAsString = incomeInput.text,incomeInputAsString.count > 0 else {
            taxOutput.text = "Please enter your gross income in dollars."
            return
        }
        guard let incomeInputAsDouble = Double(incomeInputAsString) else {
            taxOutput.text = "Please enter numeric gross income in dollars."
            return
        }
        
        var totalTaxValue:Double = 0
        
        switch incomeInputAsDouble {
        case 0...47630:
            totalTaxValue = incomeInputAsDouble*15/100
        case 47631...95259:
            totalTaxValue = 7144.5 + (incomeInputAsDouble - 47630)*20.5/100
        case 95260...147667:
            totalTaxValue = 7144.5 + 9763.945 + (incomeInputAsDouble - 95259)*26/100
        case 147668...210371:
            totalTaxValue = 7144.5 + 9763.945 + 13626.08 + (incomeInputAsDouble - 147667)*29/100
        default:
            totalTaxValue = 7144.5 + 9763.945 + 13626.08 + 18184.16 + (incomeInputAsDouble - 210371)*33/100
        }
        
        let effectiveTaxRateOutPut = totalTaxValue/incomeInputAsDouble*100
        
        
        let finalTotalTaxValue = String(format: "%.2f", totalTaxValue)
        let finalEffectiveTaxRate = String(format: "%.1f",effectiveTaxRateOutPut)
        
        
        
        
        
        taxOutput.text = "\(nameInputAsString) your federal tax owing is $\(finalTotalTaxValue)"
        
        effectiveTaxRate.text = "Effective tax rate is \(finalEffectiveTaxRate)%"
        
        
        
        
        
    }
    

}

