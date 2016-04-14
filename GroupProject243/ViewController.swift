//
//  ViewController.swift
//  GroupProject243
//
//  Created by Perry Waxman on 4/14/16.
//  Copyright © 2016 P.W. All rights reserved.
//

import UIKit

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
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        self.setupUI()
        
    }
    
    
    //MARK: - Actions
    
    @IBAction func convert(sender: AnyObject) {
        
    }
    
    @IBAction func selectApproach(sender: AnyObject) {
        
    }
    
    @IBAction func selectBase(sender: AnyObject) {
        
    }
    
    @IBAction func backgroundTap(sender: AnyObject) {
        //dismiss keyboard
        self.view.endEditing(true)
    }
    
    
    
    //MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(textField: UITextField) {
        self.moveButtonsUp()
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.moveButtonsDown()
    }
    
    //MARK: - UI
    
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

