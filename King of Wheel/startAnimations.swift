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
    UIView.animateWithDuration(2, animations: {
        
        arrow.alpha = 0
    })
    
    UIView.animateWithDuration(2, animations: {
            
        fingerTip.transform = CGAffineTransformMakeTranslation(0.0, 150.0)
        fingerTip.alpha = 0.5
        }) { (Bool) -> Void in
            UIView.animateWithDuration( 1.0 , animations: {
                fingerTip.alpha = 0
            })
    }
    
    
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


    