//
//  ViewController.swift
//  GroupProject243
//
//  Created by Perry Waxman on 4/14/16.
//  Copyright © 2016 P.W. All rights reserved.
//

import UIKit

enum Base {
    case base2
    case base16
    case undefined
}

enum Approach {
    case topDown
    case bottomUp
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Properties
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var systemTimeLabel: UILabel!
    @IBOutlet var algorithmTimeLable: UILabel!
    
    @IBOutlet var baseButton: UIButton!
    @IBOutlet var convertButton: UIButton!
    
    @IBOutlet var approachConstraint: NSLayoutConstraint!
    @IBOutlet var convertConstraint: NSLayoutConstraint!
    
    var selectedBase: Base!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        self.setupUI()
        
    }
    
    //MARK: - Conversion logic
    
    func convertNumber(numberString: String, toBase: Base){
        
        let numberToConvert = Int(numberString)
        
        
        
    }
    
    
    func goodToConvert() -> Bool{
        if self.numberTextField.text == "" || selectedBase == nil{
            let error = UIAlertController(title: "Whoops 😅", message: "You must have forgotten to input a number, chosen a base, or approach", preferredStyle: .Alert)
            let okayAction = UIAlertAction(title: "Okay", style: .Default, handler: nil)
            
            error.addAction(okayAction)
            
            self.presentViewController(error, animated: true, completion: nil)
            
            return false
            
        }else{
            return true
        }
    }
    
    
    //MARK: - Actions
    
    @IBAction func convert(sender: AnyObject) {
        
        if goodToConvert(){
            
            self.convertNumber(self.numberTextField.text!, toBase: self.selectedBase)
            
            self.moveButtonsDown()
            self.view.endEditing(true)
            
            self.showResults()
        }
        
        
    }
    
    @IBAction func selectBase(sender: AnyObject) {
        //show base picker
        let basePicker = UIAlertController(title: "Select Base", message: nil, preferredStyle: .ActionSheet)
        
        let base2 = UIAlertAction(title: "Base 2", style: .Default) { (action) in
            //logic for when base 2 is chosen
            self.selectedBase = Base.base2
            self.baseButton.setTitle("Base 2", forState: .Normal)
        }
        
        let base16 = UIAlertAction(title: "Base 16", style: .Default) { (action) in
            //logic for when base 10 is chosen
            self.selectedBase = Base.base16
            self.baseButton.setTitle("Base 16", forState: .Normal)
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        basePicker.addAction(base2)
        basePicker.addAction(base16)
        basePicker.addAction(cancel)
        
        self.presentViewController(basePicker, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func backgroundTap(sender: AnyObject) {
        //dismiss keyboard
        self.view.endEditing(true)
    }
    
    
    //MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(textField: UITextField) {
        hideResults()
        self.moveButtonsUp()
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.moveButtonsDown()
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        
        hideResults()
        
        return true
    }
    
    
    //MARK: - UI
    
    func showResults(){
        
        UIView.animateWithDuration(0.4) {
            self.systemTimeLabel.alpha = 1
            self.algorithmTimeLable.alpha = 1
            self.resultLabel.alpha = 1
            
            self.systemTimeLabel.hidden = false
            self.algorithmTimeLable.hidden = false
            self.resultLabel.hidden = false
        }
    }
    
    func hideResults(){
        
        UIView.animateWithDuration(0.4) {
            self.systemTimeLabel.alpha = 0
            self.algorithmTimeLable.alpha = 0
            self.resultLabel.alpha = 0
            
            self.systemTimeLabel.hidden = true
            self.algorithmTimeLable.hidden = true
            self.resultLabel.hidden = true
        }
    }
    
    
    func moveButtonsUp(){
        approachConstraint.constant = 350
        convertConstraint.constant = 350 + 41 + 37
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .CurveEaseInOut, animations: {
            self.view.layoutIfNeeded()
            
        }) { (done) in
            //
        }
    }
    
    func moveButtonsDown(){
        approachConstraint.constant = 55
        convertConstraint.constant = 133
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .CurveEaseInOut, animations: {
            self.view.layoutIfNeeded()
            
        }) { (done) in
            //
        }
    }
    
    func setupUI(){
        self.numberTextField.delegate = self
        
        //button corners
        let cornerRadius:CGFloat = 4
        convertButton.layer.cornerRadius = cornerRadius
        baseButton.layer.cornerRadius = cornerRadius
        
        //time labels
        systemTimeLabel.hidden = true
        algorithmTimeLable.hidden = true
        resultLabel.hidden = true
    }
    
    
}

