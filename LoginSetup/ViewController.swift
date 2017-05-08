//
//  ViewController.swift
//  LoginSetup
//
//  Created by Lane Faison on 5/7/17.
//  Copyright © 2017 RunningSocial. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var profilePicView: UIImageView!
    
    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginButton)
        loginButton.center = view.center
        loginButton.delegate = self

        if let token = FBSDKAccessToken.current() {
            fetchProfile()
        }
    }
    
    func fetchProfile() {
        print("fetch profile")
        
        let parameters = ["fields": "email, first_name, last_name, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start { (connection, result, error) -> Void in
        
            if error != nil {
                print(error!)
                return
            }
            
            if let fbEmail = (result as AnyObject)["email"]! as? String {
                print(fbEmail)
            }
            
            if let fbFirst = (result as AnyObject)["last_name"]! as? String {
                print(fbFirst)
            }
            
            if let fbLast = (result as AnyObject)["first_name"]! as? String {
                print(fbLast)
            }
            
//            if let fbPic = (result as AnyObject)["picture.type(large)"]! {
//                self.profilePicView = fbPic as! UIImageView
//            }
            
//            if let picture = result["picture"] as? NSDictionary, data = picture["data"] as? NSDictionary, url = data["url"] as? String {
//                print(url)
//            }

            if let fbPicture = (result as AnyObject)["picture"]! as? NSDictionary, let data = (fbPicture as AnyObject)["data"]! as? NSDictionary, let url = (data as AnyObject)["url"]! as? String {
                
                print(url)
                
            }
        }
    }

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("completed login")
        fetchProfile()
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }

}

