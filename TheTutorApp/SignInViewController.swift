//
//  SignInViewController.swift
//  TheTutorApp
//
//  Created by Erica Roy on 5/8/17.
//  Copyright © 2017 Erica Roy. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


class SignInViewController: UIViewController, UITextFieldDelegate, GIDSignInUIDelegate{
    
    var handle: AuthStateDidChangeListenerHandle?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            
            
            
            //self.performSegue(withIdentifier: "FeedSegue", sender: nil)
            
            
            
        })
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    //Dismiss Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Dismiss Keyboard via Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   



}
