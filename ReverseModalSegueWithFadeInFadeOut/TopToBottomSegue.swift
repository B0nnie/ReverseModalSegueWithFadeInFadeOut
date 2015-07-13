//
//  TopToBottomSegue.swift
//  ReverseModalSegueWithFadeInFadeOut
//
//  Created by Ebony Nyenya on 7/8/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

import UIKit

class TopToBottomSegue: UIStoryboardSegue {
   
    override func perform() {
        // Assign the source and destination views to local variables.
        var firstVCView = self.sourceViewController.view as UIView!
        var secondVCView = self.destinationViewController.view as UIView!
        
        // Get the screen width and height.
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        // Specify the initial position of the destination view.
        secondVCView.frame = CGRectMake(0.0, -screenHeight, screenWidth, screenHeight)
        
        // Access the app's key window and insert the destination view above the current (source) one.
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(secondVCView, aboveSubview: firstVCView)
        
        //need to set the view's alpha to 0 first in order for fadeIn method to have something to fade in from
        secondVCView.alpha = 0
       //fadeIn method called on destinationvc's view
        secondVCView.fadeIn()
        
        // Animate the transition.
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            
            secondVCView.frame = CGRectOffset(secondVCView.frame, 0.0, screenHeight)
            
            }) { (Bool) -> Void in
                
                var vc = self.destinationViewController as! UIViewController
                
                vc.definesPresentationContext = true
                
                self.sourceViewController.presentViewController(vc,
                    animated: false,
                    completion: nil)
        }
        
    }
    
}

    

