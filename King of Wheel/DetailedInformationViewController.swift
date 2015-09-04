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
    
    var content = "No Content"
    let rulesContent = SelectionData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        self.scrollViewDetailedInformation.frame = self.view.bounds
        self.scrollViewDetailedInformation.contentSize.height = NavigationOfDetailedInformation.frame.height + 16 + textOfDetailedInformation.frame.height
        self.scrollViewDetailedInformation.contentSize.width = 0
    }

    @IBAction func dismissView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    

}
