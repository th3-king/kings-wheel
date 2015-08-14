//
//  SelectionViewController.swift
//  King of Wheel
//
//  Created by Dan Scott on 2/08/2015.
//  Copyright (c) 2015 TopNotchApps. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {
    
    var selectionFromMain: Int?
    var selectionData = SelectionData().choices
    var selectionColour = SelectionData().backgroundColors
    var selectionFontColor = SelectionData().fontColors
    
    @IBOutlet weak var KeyWord: UILabel!
    @IBOutlet weak var actualSelection: UILabel!
    @IBOutlet weak var descriptionOfSelection: UILabel!
    @IBOutlet weak var backToMainButton: UIButton!
    @IBOutlet weak var hintLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if selectionFromMain != nil {
            //gets specific data dictionary from the array of data in SelectionData File
            var index = selectionData[selectionFromMain!]
            //gets the specific index of backgroundColours (from SelectionData folder) which suits the spin outcome
            let colourIndex = selectionColour[selectionFromMain!]
            //gets the specific index from fontColours which has a black/white option
            //
            let fontIndex = selectionFontColor[selectionFromMain!]
            
            KeyWord.text = index["word"]
            
            actualSelection.text = index["card"]
            descriptionOfSelection.text = index["description"]
            descriptionOfSelection.sizeToFit()
            backToMainButton.setTitleColor(colourIndex, forState: UIControlState.Normal)
            
            if index["hint"] != nil {
                hintLabel.hidden = false
                hintLabel.text = "Hint: " + index["hint"]!
                hintLabel.sizeToFit()
            } else {
                hintLabel.hidden = true
            }
            
            view.backgroundColor = colourIndex
            
            if fontIndex == false{
                KeyWord.textColor = UIColor.blackColor()
                actualSelection.textColor = UIColor.blackColor()
                descriptionOfSelection.textColor = UIColor.blackColor()
                hintLabel.textColor = UIColor.blackColor()
                backToMainButton.backgroundColor = UIColor.blackColor()
                
            } else {
                KeyWord.textColor = UIColor.whiteColor()
                actualSelection.textColor = UIColor.whiteColor()
                hintLabel.textColor = UIColor.whiteColor()
                descriptionOfSelection.textColor = UIColor.whiteColor()
                backToMainButton.backgroundColor = UIColor.whiteColor()
            }
        }
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToMainAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
