//
//  startAnimations.swift
//  King of Wheel
//
//  Created by Dan Scott on 5/08/2015.
//  Copyright © 2015 TopNotchApps. All rights reserved.
//

import Foundation
import UIKit

let wheelFunctions = WheelFunctions()

//used for starting animation to alert user which way to spin wheel
func arrowFade(arrow: UIImageView, fingerTip: UIImageView){
    UIView.animateWithDuration(3.5 , animations: {
        arrow.hidden = false
        arrow.alpha = 0
        })
            { (Bool) -> Void in
                arrow.hidden = true
                arrow.alpha = 1
        }
    
    UIView.animateWithDuration(4 , animations: {
        fingerTip.hidden = false
        fingerTip.transform = CGAffineTransformMakeTranslation(0.0, 150.0)
        fingerTip.alpha = 0
        })
        { (Bool) -> Void in
            fingerTip.hidden = true
            fingerTip.transform = CGAffineTransformMakeTranslation(0.0, -150.0)
            fingerTip.alpha = 1
    }

}

//used when user changes the selector (what picks the section of wheel) to easily hide/show the UIimages
func getSelectorAppearence(index: Int, imageArray: [UIImageView]){
    for var i = 0; i < imageArray.count; i++ {
        if i != index {
            imageArray[i].hidden = true
        } else {
            imageArray[i].hidden = false
        }
    }
    
}

//Used for terms and condition alert at start because needs to wait for rest of app to set up otherwise it will not work
func delay(delay: Double, closure:() -> ()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(),
        closure
    )
}

    