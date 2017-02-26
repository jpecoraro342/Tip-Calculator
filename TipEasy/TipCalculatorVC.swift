//
//  ViewController.swift
//  TipEasy
//
//  Created by Joseph Pecoraro on 12/15/15.
//  Copyright © 2015 Joseph Pecoraro. All rights reserved.
//

import UIKit

class TipCalculatorVC: UIViewController {
    
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipPercentField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var tipPercent: Double {
        get {
            if let tipPercent = UserDefaults.standard.object(forKey: "DefaultTipPercent") as? Double {
                return tipPercent
            }
            else {
                self.tipPercent = 18.0;
                return 18.0;
            }
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "DefaultTipPercent")
        }
    }
    
    var tipAmount: Double {
        get {
            return self.tipPercent * self.billAmount
        }
    }
    
    var billAmount: Double {
        get {
            if let billAmount = UserDefaults.standard.object(forKey: "BillAmount") as? Double {
                return billAmount
            }
            self.billAmount = 0
            return 0;
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "BillAmount")
        }
    }
    
    var currentTipAmount: Double = 0.0
    
    var roundedTipPercent: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipPercentField.text = getPercentFormat(tipPercent)
        billAmountField.text = getCurrencyFormat(billAmount)
        
        // if has been a while
        // reset bill amount
        
        // else use previous
        
        updateTip()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.billAmountField.becomeFirstResponder()
    }
    
    func updateTip() {
        currentTipAmount = tipAmount;
        tipLabel.text = getCurrencyFormat(tipAmount);
        totalLabel.text = getCurrencyFormat(billAmount + tipAmount);
    }
    
    func tipRounded(_ newTotal: NSDecimalNumber) {
        currentTipAmount = newTotal.doubleValue - billAmount
        roundedTipPercent = currentTipAmount / billAmount
        totalLabel.text = getCurrencyFormat(billAmount + currentTipAmount)
        tipLabel.text = getCurrencyFormat(currentTipAmount);
        tipPercentField.text = getPercentFormat(roundedTipPercent);
    }
    
    @IBAction func billAmountChanged(_ sender: AnyObject) {
        billAmount = NSString(string: billAmountField.text!).doubleValue
        updateTip()
    }
    
    @IBAction func billEditingBegan(_ sender: AnyObject) {
        billAmountField.text = "";
    }
    
    @IBAction func billEditingEnded(_ sender: AnyObject) {
        billAmountField.text = getCurrencyFormat(NSString(string: billAmountField.text!).doubleValue)
    }
    
    @IBAction func tipPercentChanged(_ sender: AnyObject) {
        tipPercent = NSString(string: tipPercentField.text!).doubleValue/100.0
        updateTip()
    }
    
    @IBAction func tipEditingBegan(_ sender: AnyObject) {
        tipPercentField.text = "";
    }
    
    @IBAction func tipEditingEnded(_ sender: AnyObject) {
        tipPercentField.text = getPercentFormat(NSString(string: tipPercentField.text!).doubleValue/100.0)
    }
    
    func getCurrencyFormat(_ price: Double) -> String {
        let convertedPrice = currencyFormatter.string(from: price as NSNumber)
        return convertedPrice!
    }
    
    func getPercentFormat(_ percent: Double) -> String {
        if let percentString = percentFormatter.string(from: percent as NSNumber) {
            return percentString
        }
        else {
            return "0%"
        }
    }
    
    @IBAction func backgroundTapped(_ sender: AnyObject) {
        self.view.endEditing(true);
    }
    
    @IBAction func roundUp(_ sender: UIButton) {
        let roundFactor = getCurrencyAsNumber((sender.titleLabel?.text)!)
        let newTotal = TipRounder.roundUp(NSDecimalNumber(value: billAmount + currentTipAmount as Double), roundAmount: roundFactor)
        tipRounded(newTotal)
    }
    
    @IBAction func roundDown(_ sender: UIButton) {
        let roundFactor = getCurrencyAsNumber((sender.titleLabel?.text)!)
        let newTotal = TipRounder.roundDown(NSDecimalNumber(value: billAmount + currentTipAmount as Double), roundAmount: roundFactor)
        tipRounded(newTotal)
    }
    
    func getCurrencyAsNumber(_ currency: String) -> NSDecimalNumber {
        return currencyFormatter.number(from: currency) as! NSDecimalNumber
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

