//
//  ExampleViewController.swift
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
        
        _ = ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .default)
        print("Hud SHOW")
        
        self.hideAfterDelay()
    }
    
    @IBAction func showGoogleHUD() {
        
        _ = ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .google)
        print("Hud SHOW")
        
        self.hideAfterDelay()
    }
    
    @IBAction func showFlagHUD() {
        
        _ = ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .flag)
        print("Hud SHOW")
        
        self.hideAfterDelay()
    }
    
    @IBAction func showCustomHUD() {
        
        let property = HudProperty(prefixName: "coffee", frameNumber: 13, size: 70, backgroundColor: UIColor.yellow())
        _ = ASProgressHud.showCustomHUDAddedTo(self.view, animated: true, property: property)
        print("Hud SHOW")
        
        self.hideAfterDelay()
    }
    
    func hideAfterDelay() {
        
        let delayTime = DispatchTime.now() + 3.0
        DispatchQueue.main.after(when: delayTime) {
            _ = ASProgressHud.hideHUDForView(self.view, animated: true)
            print("Hud HIDE")
        }
    }
    
}
