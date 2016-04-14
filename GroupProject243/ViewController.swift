//
//  ViewController.swift
//  GroupProject243
//
//  Created by Perry Waxman on 4/14/16.
//  Copyright © 2016 P.W. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var systemTimeLabel: UILabel!
    @IBOutlet var algorithmTimeLable: UILabel!
    
    @IBOutlet var approachButton: UIButton!
    @IBOutlet var baseButton: UIButton!
    @IBOutlet var convertButton: UIButton!
    
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
    
    
    //MARK: - UI
    func setupUI(){
        //button corners
        convertButton.layer.cornerRadius = 8
        approachButton.layer.cornerRadius = 8
        baseButton.layer.cornerRadius = 8
        
        //time labels
        systemTimeLabel.text = ""
        algorithmTimeLable.text = ""
        resultLabel.text = ""
    }


}

