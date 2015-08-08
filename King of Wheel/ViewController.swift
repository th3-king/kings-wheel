//
//  ViewController.swift
//  King of Wheel
//
//  Created by Dan Scott on 24/07/2015.
//  Copyright (c) 2015 TopNotchApps. All rights reserved.
//

import UIKit



class ViewController: UIViewController, ModalViewControllerDelegate {
    
    @IBOutlet weak var crownIcon: UIImageView!
    @IBOutlet weak var Wheel: UIImageView!
    @IBOutlet weak var fingerTip: UIImageView!
    @IBOutlet weak var arrow: UIImageView!
    @IBOutlet weak var pointerSelector: UIImageView!
    @IBOutlet weak var kingSelector: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    var wheelFunctions = WheelFunctions()
    var buttonPressed = 0
    var lastSelection: Float = 0.0
    var outCome = 0
    var selectorIndex = 0
    var selectorArray : [UIImageView] = []
    @IBOutlet var swipeDown: UISwipeGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Wheel.image = UIImage(named: "perfectedWheel.png")
        
        swipeDown.direction = .Down
        view.addGestureRecognizer(swipeDown)
        arrowFade(arrow, fingerTip: fingerTip)
        
        selectorArray += [crownIcon, pointerSelector, kingSelector]
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        if buttonPressed > 0 {
          wheelFunctions.resetCrown(crownIcon, view: view)
        }
        swipeDown.enabled = true
        getSelectorAppearence(selectorIndex, imageArray: selectorArray)
        if selectorIndex == 2 {
            backgroundImage.image = UIImage(named: "backgroundOfMainView3.png")
        } else {
            backgroundImage.image = UIImage(named: "backgroundOfMainView4.png")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Passing information from outcome of spin to modal view
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "selectionModal" {
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
            var selection = wheelFunctions.spinWheel(Wheel, currentView: self)
            selection = (selection + lastSelection) % 360.0
            print(selection)
            wheelFunctions.dropCrown(crownIcon, view: view)
            outCome = wheelFunctions.determineSelection(selection)
            ++buttonPressed
            lastSelection = selection

        }
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

