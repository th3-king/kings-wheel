//
//  ViewController.swift
//  King of Wheel
//
//  Created by Dan Scott on 24/07/2015.
//  Copyright (c) 2015 TopNotchApps. All rights reserved.
//

import UIKit

/*
TASKS:
1. when viewcontroller is initially loaded finger + arrow images execute function
2. stop alert controller from appearing every time
3 chill fam
*/

class ViewController: UIViewController, ModalViewControllerDelegate {
    
    @IBOutlet weak var crownIcon: UIImageView!
    @IBOutlet weak var Wheel: UIImageView!
    @IBOutlet weak var fingerTip: UIImageView!
    @IBOutlet weak var arrow: UIImageView!
    @IBOutlet weak var pointerSelector: UIImageView!
    @IBOutlet weak var kingSelector: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet var swipeDown: UISwipeGestureRecognizer!
    
    
    
    var wheelFunctions = WheelFunctions()
    var buttonPressed = 0
    var lastSelection: Float = 0.0
    var outCome = 0
    var selectorIndex = 0
    var selectorArray : [UIImageView] = []
    let defaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Wheel.image = UIImage(named: "perfectedWheelUpdatedColors.png")
        
        
        
        swipeDown.direction = .Down
        view.addGestureRecognizer(swipeDown)
        
        
        selectorArray += [crownIcon, pointerSelector, kingSelector]
        
        if (defaults.objectForKey("alertShown") == nil) {
            let termsAndConditions = UIAlertController(title: "Terms and Conditions",
                message: "By pressing 'OK' you are agreeing to the terms and conditions outlined in the information screen (found by clicking i button below wheel)",preferredStyle: UIAlertControllerStyle.Alert)
            termsAndConditions.addAction(UIAlertAction(title: "OK", style: .Default , handler: nil))
            
            delay(0.1) {
                self.presentViewController(termsAndConditions, animated: true, completion: nil)
            }
            defaults.setObject(1, forKey: "alertShown")
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        swipeDown.enabled = true
        getSelectorAppearence(selectorIndex, imageArray: selectorArray)
        if selectorIndex == 2 {
            backgroundImage.image = UIImage(named: "backgroundOfMainView3.png")
        } else {
            backgroundImage.image = UIImage(named: "backgroundOfMainView4.png")
        }
        arrowFade(arrow, fingerTip: fingerTip)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Passing information from outcome of spin to modal view
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "selectionModal" {
            wheelFunctions.resetCrown(crownIcon, view: view)
            let SelectionController = segue.destinationViewController as! SelectionViewController
            SelectionController.selectionFromMain = outCome
        }
        if segue.identifier == "informationSegue" {
            let informationController = segue.destinationViewController as! InformationViewController
            informationController.selectedAppearanceIndex = self.selectorIndex
            informationController.delegate = self
        }
    }
    
    
    //when a swipe gesture that is downwards occurs it executes code 
    //(in stroyboard re-enable the other swipe gesture to activate down and up)
    @IBAction func swipeSpinWheel(sender: UISwipeGestureRecognizer) {
        if (swipeDown.direction == .Down){
            //saves the spin (in degrees) to a variable named selection
            var selection = wheelFunctions.spinWheel(Wheel, currentView: self)
            
            //selection then adds the old selection and mods by 360 so it use the function
            //determineSelecttion correctly making the 0 degrees on UIimage back to normal
            selection = (selection + lastSelection) % 360.0
            
            //The assigns outcome the determined selection from the spin (selection)
            //outcome is used in the switch statement to modify the UI of the SelectionViewController view
            outCome = wheelFunctions.determineSelection(selection)
            
            //The dropCrown function takes the Crown UIImage and transforms it downwards
            ///onto the relevant selection (for visual purposes only)
            wheelFunctions.dropCrown(crownIcon, view: view)
            
            //button pressed is used only so the crown only resets after at least one swipe
            ++buttonPressed
            
            //lastSelection is assigned to the previous selection so the angle can be used
            //in the detemineSelection function
            lastSelection = selection

        }
        //The swipe gesture is disabled so that the user can't spin it many times
        //which elimates a bug, it is re-enabled in viewWillAppear method
        swipeDown.enabled = false
    }
    
    func sendValue(value: Int) {
        self.selectorIndex = value
    }
    
    //sets top bar with battery and time to white style
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
       return UIStatusBarStyle.LightContent
    }
    

}

