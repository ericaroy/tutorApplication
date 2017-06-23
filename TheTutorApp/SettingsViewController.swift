//
//  SettingsViewController.swift
//  TheTutorApp
//
//  Created by Erica Roy on 6/22/17.
//  Copyright © 2017 Erica Roy. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var user = Auth.auth().currentUser?.uid
        var handle: AuthStateDidChangeListenerHandle?

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signOutUser(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            GIDSignIn.sharedInstance().signOut()
            
            print("Signed Out")
            self.dismiss(animated: true, completion: {
                print("Dismissed")
                
            })
        } catch  {
            print ("Error signing out:")
            print(Error.self)
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
