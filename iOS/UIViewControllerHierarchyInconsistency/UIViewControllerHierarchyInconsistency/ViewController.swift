//
//  ViewController.swift
//  UIViewControllerHierarchyInconsistency
//
//  Created by stoprain on 6/18/15.
//  Copyright © 2015 stoprain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var t: TestViewController?
    var n: UINavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(0.1 * Double(NSEC_PER_SEC)))
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            self.t = TestViewController()
            self.n = UINavigationController(rootViewController: self.t!)
            self.presentViewController(self.n!, animated: true, completion: { () -> Void in
                let dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(0.1 * Double(NSEC_PER_SEC)))
                dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                    self.n?.dismissViewControllerAnimated(true, completion: { () -> Void in
                        self.view.addSubview(self.t!.view)
                    })
                })
            })
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

