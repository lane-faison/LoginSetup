//
//  ViewController.swift
//  LoginSetup
//
//  Created by Lane Faison on 5/7/17.
//  Copyright © 2017 RunningSocial. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginButton)
        loginButton.center = view.center

    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

