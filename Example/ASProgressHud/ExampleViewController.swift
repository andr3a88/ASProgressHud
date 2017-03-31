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
        
        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .default)
        print("Hud SHOW")
        
        self.hideAfterDelay()
    }
    
    @IBAction func showGoogleHUD() {
        
        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .google)
        print("Hud SHOW")
        
        self.hideAfterDelay()
    }
    
    @IBAction func showFlagHUD() {
        
        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .flag)
        print("Hud SHOW")
        
        self.hideAfterDelay()
    }
    
    @IBAction func showCustomHUD() {
        
        let property = HudProperty(prefixName: "coffee", frameNumber: 13, size: 70, animationDuration: 0.2, backgroundColor: UIColor.yellow)
        ASProgressHud.showCustomHUDAddedTo(self.view, animated: true, property: property)
        print("Hud SHOW")
        
        self.hideAfterDelay()
    }
    
    func hideAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            ASProgressHud.hideHUDForView(self.view, animated: true)
            print("Hud HIDE")
        }
    }
    
}

