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
        let cornerRadius:CGFloat = 4
        convertButton.layer.cornerRadius = cornerRadius
        approachButton.layer.cornerRadius = cornerRadius
        baseButton.layer.cornerRadius = cornerRadius
        
        //time labels
        systemTimeLabel.text = ""
        algorithmTimeLable.text = ""
        resultLabel.text = ""
    }


}

