//
//  InformationViewController.swift
//  King of Wheel
//
//  Created by Dan Scott on 7/08/2015.
//  Copyright © 2015 TopNotchApps. All rights reserved.
//

import UIKit
import Social

protocol ModalViewControllerDelegate {
    func sendValue(var value : Int)
}

class InformationViewController: UIViewController {
    
    
    @IBOutlet weak var SelectorAppearance: UISegmentedControl!
    var selectedAppearanceIndex = 0
    var delegate:ModalViewControllerDelegate!
    var content = "No Content"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        //shows the currently selected segment highlighted in the segmented control
        SelectorAppearance.selectedSegmentIndex = selectedAppearanceIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailedInformationSegue" {
            let DetailedInformationController = segue.destinationViewController as! DetailedInformationViewController
            DetailedInformationController.content = self.content
        }
    }
    
    
    @IBAction func selectionType(sender: AnyObject) {
        //checks what is selected in the segmented control and assigns a certain value if different options are selected
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
    
    @IBAction func facebookShare(sender: AnyObject) {
        //adds a share to facebook function to the button so people can share the app
        let shareToFacebook : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        shareToFacebook.setInitialText("Best drinking game for parties or groups, it's really a must have app")
        //links a url to app on appstore (not sure what it will be yet)
        shareToFacebook.addURL(NSURL(string: "http://www.google.com"))
        
        self.presentViewController(shareToFacebook , animated: true, completion: nil)
    }
    
    @IBAction func twitterShare(sender: AnyObject) {
        //adds a share to twitter function to the twitter button so people can share the app
        let shareToTwitter : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        shareToTwitter.setInitialText("Best drinking game for parties or groups, it's really a must have app")
        //links a url to app on appstore (not sure what it will be yet)
        shareToTwitter.addURL(NSURL(string: "http://www.google.com"))

        self.presentViewController(shareToTwitter , animated: true, completion: nil)
        
    }
    
    @IBAction func termsAndConditionsButton(sender: AnyObject) {
        content = "Terms and Conditions"
        performSegueWithIdentifier("DetailedInformationSegue", sender: nil)
    }
    
    @IBAction func rulesButton(sender: AnyObject) {
        content = "Rules"
        performSegueWithIdentifier("DetailedInformationSegue", sender: nil)
    }
    
    

}
