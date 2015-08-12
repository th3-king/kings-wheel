//
//  WheelFunctions.swift
//  King of Wheel
//
//  Created by Dan Scott on 24/07/2015.
//  Copyright (c) 2015 TopNotchApps. All rights reserved.
//

import Foundation
import UIKit
import GLKit

struct WheelFunctions {
    //Function that retrieves the angle for transform, has to be less than or equal to
    //180 degrees so it rotates clockwise only
    func randomAngle() -> CGFloat {
        var ran = CGFloat(Float(arc4random()) % Float(GLKMathDegreesToRadians(180.0)))
        while ran < 0.8 {
            ran = CGFloat(Float(arc4random()) % Float(GLKMathDegreesToRadians(180.0)))
        }
        return ran
    }
    /*
    spinWheel function takes the UIImage of the wheel and declares a second function
    within the scope of spinWheel which takes a parameter loops which affects how
    many time the transform is done, whilst slowing it with time.
    */
    func spinWheel(picture: UIImageView, currentView: UIViewController) -> Float{
        var spin = self.randomAngle()
        
        func executeRotation(loops: Int) -> Float{
            var multipliedTime = CGFloat(0.5)
            for var i = 0; i < loops - 1; i++ {
                UIView.animateWithDuration(NSTimeInterval(spin * multipliedTime) , animations: {
                    picture.transform = CGAffineTransformRotate(picture.transform , 3.1)
                    picture.transform = CGAffineTransformRotate(picture.transform , spin)
                    picture.transform = CGAffineTransformRotate(picture.transform , spin)
                })
            multipliedTime += CGFloat(0.5)
            }
            multipliedTime += CGFloat(0.5)
            
            UIView.animateWithDuration(NSTimeInterval(spin * multipliedTime), animations: {
                    picture.transform = CGAffineTransformRotate(picture.transform , 3.1)
                    picture.transform = CGAffineTransformRotate(picture.transform , spin)
                    picture.transform = CGAffineTransformRotate(picture.transform , spin)
                    }, completion: {(Bool) in
                        currentView.performSegueWithIdentifier("selectionModal", sender: nil)
                })
            
            let spinToDegrees = GLKMathRadiansToDegrees(Float(spin));
            let degreeOfSpin = (spinToDegrees * 2 + GLKMathRadiansToDegrees(3.1))*Float(loops) % 360
            return degreeOfSpin;
        }
        let degreeOfSpin = executeRotation(5)
        return degreeOfSpin
    }
    
    
    func dropCrown(crown: UIImageView, view : UIView){
        UIView.animateWithDuration(3.0, animations: {
            crown.transform = CGAffineTransformTranslate(crown.transform, 0.0, 48)
        })
    }
    
    
    func resetCrown(crown: UIImageView, view : UIView){
        UIView.animateWithDuration(0, animations: {
            crown.transform = CGAffineTransformTranslate(crown.transform, 0.0, -48)
        })
    }
    
    func determineSelection(selection: Float) -> Int{
        switch(true){
        case (selection >= 0.0 &&  selection <= (360/13)-0.001):
            return 12
        case (selection >= (360/13) &&  selection <= (360/13)*2-0.001):
            return 11
        case  (selection >= (360/13)*2 &&  selection <= (360/13)*3-0.001):
            return 10
        case (selection >= (360/13)*3 &&  selection <= (360/13)*4-0.001):
            return 9
        case (selection >= (360/13)*4 &&  selection <= (360/13)*5-0.001):
            return 8
        case (selection >= (360/13)*5 &&  selection <= (360/13)*6-0.001):
            return 7
        case (selection >= (360/13)*6 &&  selection <= (360/13)*7-0.001):
            return 6
        case (selection >= (360/13)*7 &&  selection <= (360/13)*8-0.001):
            return 5
        case (selection >= (360/13)*8 &&  selection <= (360/13)*9-0.001):
            return 4
        case (selection >= (360/13)*9 &&  selection <= (360/13)*10-0.001):
            return 3
        case (selection >= (360/13)*10 &&  selection <= (360/13)*11-0.001):
            return 2
        case (selection >= (360/13)*11 &&  selection <= (360/13)*12-0.001):
            return 1
        case (selection >= (360/13)*12 &&  selection <= (360/13)*13-0.001):
            return 0
        default:
            return 0
        }
    }
    
}