//
//  CustomNavigationController.swift
//  ReverseModalSegueWithFadeInFadeOut
//
//  Created by Ebony Nyenya on 7/8/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //unwind methods for custom unwinding back to the previous viewcontroller
    @IBAction func unwindToFirstViewController(segue:UIStoryboardSegue) {
        
        
    }
    
    override func segueForUnwindingToViewController(toViewController: UIViewController,
        fromViewController: UIViewController,
        identifier: String?) -> UIStoryboardSegue {
            
            return UIStoryboardSegue(identifier: "UnwindSegueToFirstVC", source: fromViewController, destination: toViewController) {
                
                
                var toVCView = toViewController.view as UIView!
                var fromVCView = fromViewController.view as UIView!
                
                
                let screenWidth = UIScreen.mainScreen().bounds.size.width
                let screenHeight = UIScreen.mainScreen().bounds.size.height
                
                toVCView.frame = CGRectMake(0.0, 0, screenWidth, screenHeight)
                fromVCView.frame = CGRectMake(0.0, 0, screenWidth, screenHeight)
                
                let window = UIApplication.sharedApplication().keyWindow
                
                
                window?.insertSubview(toVCView, belowSubview: fromVCView)
                
                window?.insertSubview(fromVCView, aboveSubview: toVCView)
                
             //call fadeOut method on view
                fromVCView.fadeOut()

                UIView.animateWithDuration(1.0, animations: { () -> Void in
                    
                    fromVCView.frame = CGRectOffset(fromVCView.frame, 0.0, -screenHeight)
                    
                    }) { (Bool) -> Void in
                        
                        
                        fromViewController.dismissViewControllerAnimated(false, completion: nil)
                }
                
            }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
