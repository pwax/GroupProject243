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
    case base10
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
    
    @IBOutlet var approachButton: UIButton!
    @IBOutlet var baseButton: UIButton!
    @IBOutlet var convertButton: UIButton!
    
    @IBOutlet var approachConstraint: NSLayoutConstraint!
    @IBOutlet var convertConstraint: NSLayoutConstraint!
    
    var selectedBase: Base!
    var selectedApproach: Approach!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        self.setupUI()
        
    }
    
    //MARK: - Conversion logic
    
    func determineInputNumberBase(inputNumber: String) -> Base{
        
        let basePrefix = String(inputNumber.characters.prefix(2))
        
        var base: Base!
        
        if basePrefix == "0b"{
            base = Base.base2
        }else if basePrefix == "1b"{
            base = Base.base10
        }else if basePrefix == "0x"{
            base = Base.base16
        }else{
            base = Base.undefined
        }
        
        print("input base: \(base)")
        
        return base
        
    }
    
    func convertNumber(numberString: String, withInputBase inputBase: Base, withApproach approach: Approach, toBase base: Base){
        
        if inputBase == .undefined{
            //dont convert anything since the base is undefined
            let error = UIAlertController(title: "Whoops 😅", message: "Your input base is undefined", preferredStyle: .Alert)
            let okayAction = UIAlertAction(title: "Okay", style: .Default, handler: nil)
            
            error.addAction(okayAction)
            
            self.presentViewController(error, animated: true, completion: nil)
            
        }else{
            //do our fun stuff
            
        }
        
        
        
    }
    
    func goodToConvert() -> Bool{
        if self.numberTextField.text == "" || selectedBase == nil  || selectedApproach == nil{
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
            
            convertNumber(numberTextField.text!, withInputBase: determineInputNumberBase(numberTextField.text!), withApproach: self.selectedApproach, toBase: self.selectedBase)
            
            
            self.moveButtonsDown()
            self.view.endEditing(true)
            
            self.showResults()
        }
        
        
    }
    
    @IBAction func selectApproach(sender: AnyObject) {
        //show approach picker
        let approachPicker = UIAlertController(title: "Select Base", message: nil, preferredStyle: .ActionSheet)
        
        let topDown = UIAlertAction(title: "Top-Down", style: .Default) { (action) in
            //logic for when top down is chosen
            self.selectedApproach = Approach.topDown
            self.approachButton.setTitle("Top-Down", forState: .Normal)
        }
        
        let bottomUp = UIAlertAction(title: "Bottom-Up", style: .Default) { (action) in
            //logic for when bottom up is chosen
            self.selectedApproach = Approach.bottomUp
            self.approachButton.setTitle("Bottom-Up", forState: .Normal)
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        approachPicker.addAction(topDown)
        approachPicker.addAction(bottomUp)
        approachPicker.addAction(cancel)
        
        
        self.presentViewController(approachPicker, animated: true, completion: nil)
        
    }
    
    @IBAction func selectBase(sender: AnyObject) {
        //show base picker
        let basePicker = UIAlertController(title: "Select Base", message: nil, preferredStyle: .ActionSheet)
        
        let base2 = UIAlertAction(title: "Base 2", style: .Default) { (action) in
            //logic for when base 2 is chosen
            self.selectedBase = Base.base2
            self.baseButton.setTitle("Base 2", forState: .Normal)
        }
        
        let base10 = UIAlertAction(title: "Base 10", style: .Default) { (action) in
            //logic for when base 10 is chosen
            self.selectedBase = Base.base10
            self.baseButton.setTitle("Base 10", forState: .Normal)
            
        }
        
        let base16 = UIAlertAction(title: "Base 16", style: .Default) { (action) in
            //logic for when base 10 is chosen
            self.selectedBase = Base.base16
            self.baseButton.setTitle("Base 16", forState: .Normal)
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        basePicker.addAction(base2)
        basePicker.addAction(base10)
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
        approachButton.layer.cornerRadius = cornerRadius
        baseButton.layer.cornerRadius = cornerRadius
        
        //time labels
        systemTimeLabel.hidden = true
        algorithmTimeLable.hidden = true
        resultLabel.hidden = true
    }
    
    
}

