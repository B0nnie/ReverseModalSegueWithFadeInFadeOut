//
//  ViewController.swift
//  ReverseModalSegueWithFadeInFadeOut
//
//  Created by Ebony Nyenya on 7/8/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    //use custom segue class for reverse modal default segue
    @IBAction func nextBtn(sender: AnyObject) {
        
        performSegueWithIdentifier("topToBottomSegue", sender: nil)
       
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

