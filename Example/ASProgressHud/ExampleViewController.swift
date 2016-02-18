//
//  ViewController.swift
//  ASProgressHud
//
//  Created by Andrea on 02/17/2016.
//  Copyright (c) 2016 Andrea. All rights reserved.
//

import UIKit
import ASProgressHud

class ExampleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func showWhiteHUD() {
        
        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
        print("Hud SHOW")
        
        self.hideAfterDelay()
    }
    
    @IBAction func showGoogleHUD() {
        
        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Google)
        print("Hud SHOW")
        
        self.hideAfterDelay()
    }
    
    @IBAction func showFlagHUD() {
        
        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Flag)
        print("Hud SHOW")
        
        self.hideAfterDelay()
    }
    
    @IBAction func showCustomHUD() {
        
        let property = HudProperty(prefixName: "coffee", frameNumber: 13, size: 70, backgroundColor: UIColor.yellowColor())
        ASProgressHud.showCustomHUDAddedTo(self.view, animated: true, hudProperty: property)
        print("Hud SHOW")
        
        self.hideAfterDelay()
    }
    
    func hideAfterDelay() {
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(3 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            
            ASProgressHud.hideHUDForView(self.view, animated: true)
            print("Hud HIDE")
        }
    }
    
}