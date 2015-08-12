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


func arrowFade(arrow: UIImageView, fingerTip: UIImageView){
    UIView.animateWithDuration(4, animations: {
        arrow.hidden = false
        arrow.alpha = 0
        arrow.hidden = true
        arrow.alpha = 1
    })
    
    UIView.animateWithDuration(4, animations: {
        fingerTip.hidden = false
        fingerTip.transform = CGAffineTransformMakeTranslation(0.0, 150.0)
        fingerTip.alpha = 0
        fingerTip.hidden = true
        fingerTip.transform = CGAffineTransformMakeTranslation(0.0, -150.0)
        fingerTip.alpha = 1
        })

}


func getSelectorAppearence(index: Int, imageArray: [UIImageView]){
    for var i = 0; i < imageArray.count; i++ {
        if i != index {
            imageArray[i].hidden = true
        } else {
            imageArray[i].hidden = false
        }
    }
    
}

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

    