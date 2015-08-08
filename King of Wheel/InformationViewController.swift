//
//  InformationViewController.swift
//  King of Wheel
//
//  Created by Dan Scott on 7/08/2015.
//  Copyright © 2015 TopNotchApps. All rights reserved.
//

import UIKit

protocol ModalViewControllerDelegate {
    func sendValue(var value : Int)
}

class InformationViewController: UIViewController {
    

    @IBOutlet weak var SelectorAppearance: UISegmentedControl!
    var selectedAppearanceIndex = 0
    var delegate:ModalViewControllerDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        SelectorAppearance.selectedSegmentIndex = selectedAppearanceIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func selectionType(sender: AnyObject) {
        if (SelectorAppearance.selectedSegmentIndex == 0) {
            selectedAppearanceIndex = 0
        }
        if (SelectorAppearance.selectedSegmentIndex == 1) {
            selectedAppearanceIndex = 1
        }
        if (SelectorAppearance.selectedSegmentIndex == 2) {
            selectedAppearanceIndex = 2
        }
    }
    

    @IBAction func backToMain(sender: AnyObject) {
        self.delegate.sendValue(selectedAppearanceIndex)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    
    
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
