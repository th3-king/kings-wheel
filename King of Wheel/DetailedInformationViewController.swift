//
//  DetailedInformationViewController.swift
//  King of Wheel
//
//  Created by Dan Scott on 27/08/2015.
//  Copyright © 2015 TopNotchApps. All rights reserved.
//

import UIKit

class DetailedInformationViewController: UIViewController {
    
    
    @IBOutlet weak var NavigationOfDetailedInformation: UINavigationBar!
    @IBOutlet weak var textOfDetailedInformation: UILabel!
    @IBOutlet weak var scrollViewDetailedInformation: UIScrollView!
    @IBOutlet weak var titleOfNavigationBar: UINavigationItem!
    
    //used to change content in UIScrollView
    var content = "No Content"
    let rulesContent = SelectionData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Used to change content within UIScrollView
        switch true {
        case content == "Terms and Conditions":
            titleOfNavigationBar.title = Terms["title"]
            textOfDetailedInformation.text = Terms["content"]
            break;
        case content == "Rules":
            titleOfNavigationBar.title = "Rules"
            textOfDetailedInformation.text = rulesContent.rulesAsOne
            break;
        default:
            break;
            }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        //Sets up UIScrollView to size of screen and length of scroll to length of content included
        self.scrollViewDetailedInformation.frame = self.view.bounds
        self.scrollViewDetailedInformation.contentSize.height = NavigationOfDetailedInformation.frame.height + 16 + textOfDetailedInformation.frame.height
        self.scrollViewDetailedInformation.contentSize.width = 0
    }

    //general function linked to 'done' button to dismiss view
    @IBAction func dismissView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //hides status bar for better appearence
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    

}
