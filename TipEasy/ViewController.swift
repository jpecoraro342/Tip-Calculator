//
//  ViewController.swift
//  TipEasy
//
//  Created by Joseph Pecoraro on 12/15/15.
//  Copyright © 2015 Joseph Pecoraro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipLabel.text = "$0.00";
        totalLabel.text = "0.00";
    }
    
    @IBAction func onEditChanged(sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.22];
        
        let billAmount = NSString(string: billAmountField.text!).doubleValue;
        let selectedTip = tipPercentages[tipControl.selectedSegmentIndex];
        let tipAmount = selectedTip * billAmount;
        
        let total = billAmount + tipAmount;
        
        tipLabel.text = getCurrencyFormat(Float(tipAmount));
        totalLabel.text = getCurrencyFormat(Float(total));
    }
    
    func getCurrencyFormat(amount: Float) -> String {
        return String(format: "$%.2f", amount);
    }
    
    @IBAction func backgroundTapped(sender: AnyObject) {
        self.view.endEditing(true);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

