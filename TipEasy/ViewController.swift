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
    @IBOutlet weak var tipPercentField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    let currencyFormatter: NSNumberFormatter = NSNumberFormatter()
    
    var tipPercent: Double {
        get {
            if let tipPercent = NSUserDefaults.standardUserDefaults().objectForKey("DefaultTipPercent") as? Double {
                return tipPercent
            }
            else {
                self.tipPercent = 18.0;
                return 18.0;
            }
        }
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "DefaultTipPercent")
        }
    }
    
    var tipAmount: Double {
        get {
            return self.tipPercent * self.billAmount
        }
    }
    
    var billAmount: Double {
        get {
            if let billAmount = NSUserDefaults.standardUserDefaults().objectForKey("BillAmount") as? Double {
                return billAmount
            }
            self.billAmount = 0
            return 0;
        }
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "BillAmount")
        }
    }
    
    var currentTipAmount: Double = 0.0
    
    var roundedTipPercent: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyFormatter.numberStyle = .CurrencyStyle
        currencyFormatter.generatesDecimalNumbers = true
        currencyFormatter.locale = NSLocale.currentLocale()
        
        tipPercentField.text = getPercentFormat(tipPercent)
        billAmountField.text = getCurrencyFormat(billAmount)
        
        // if has been a while
        // reset bill amount
        
        // else use previous
        
        updateTip()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        self.billAmountField.becomeFirstResponder()
    }
    
    func updateTip() {
        currentTipAmount = tipAmount;
        tipLabel.text = getCurrencyFormat(tipAmount);
        totalLabel.text = getCurrencyFormat(billAmount + tipAmount);
    }
    
    func tipRounded(newTotal: NSDecimalNumber) {
        currentTipAmount = newTotal.doubleValue - billAmount
        roundedTipPercent = currentTipAmount / billAmount
        totalLabel.text = getCurrencyFormat(billAmount + currentTipAmount)
        tipLabel.text = getCurrencyFormat(currentTipAmount);
        tipPercentField.text = getPercentFormat(roundedTipPercent);
    }
    
    @IBAction func billAmountChanged(sender: AnyObject) {
        billAmount = NSString(string: billAmountField.text!).doubleValue
        updateTip()
    }
    
    @IBAction func billEditingBegan(sender: AnyObject) {
        billAmountField.text = "";
    }
    
    @IBAction func billEditingEnded(sender: AnyObject) {
        billAmountField.text = getCurrencyFormat(NSString(string: billAmountField.text!).doubleValue)
    }
    
    @IBAction func tipPercentChanged(sender: AnyObject) {
        tipPercent = NSString(string: tipPercentField.text!).doubleValue/100.0
        updateTip()
    }
    
    @IBAction func tipEditingBegan(sender: AnyObject) {
        tipPercentField.text = "";
    }
    
    @IBAction func tipEditingEnded(sender: AnyObject) {
        tipPercentField.text = getPercentFormat(NSString(string: tipPercentField.text!).doubleValue/100.0)
    }
    
    func getCurrencyFormat(price: Double) -> String {
        let convertedPrice = currencyFormatter.stringFromNumber(price)
        return convertedPrice!
    }
    
    func getPercentFormat(percent: Double) -> String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .PercentStyle
        formatter.minimumFractionDigits = 1
        return formatter.stringFromNumber(percent)!;
    }
    
    @IBAction func backgroundTapped(sender: AnyObject) {
        self.view.endEditing(true);
    }
    
    @IBAction func roundUp(sender: UIButton) {
        let roundFactor = getCurrencyAsNumber((sender.titleLabel?.text)!)
        let newTotal = TipRounder.roundUp(NSDecimalNumber(double: billAmount + currentTipAmount), roundAmount: roundFactor)
        tipRounded(newTotal)
    }
    
    @IBAction func roundDown(sender: UIButton) {
        let roundFactor = getCurrencyAsNumber((sender.titleLabel?.text)!)
        let newTotal = TipRounder.roundDown(NSDecimalNumber(double: billAmount + currentTipAmount), roundAmount: roundFactor)
        tipRounded(newTotal)
    }
    
    func getCurrencyAsNumber(currency: String) -> NSDecimalNumber {
        return currencyFormatter.numberFromString(currency) as! NSDecimalNumber
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

