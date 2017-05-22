//
//  SignUpViewController.swift
//  TheTutorApp
//
//  Created by Erica Roy on 5/8/17.
//  Copyright © 2017 Erica Roy. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var emailInput: UITextField!
    
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    

  

    @IBAction func cancelButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true)
        
    }
    
    func validateEmail(emailString: String) -> Bool {
        var returnStatus = true
        
        
        
        //if invalid set returnstatus false
        //else return
        //create regex only allowing school domain
        
        return returnStatus
        
        
        
    }
        
}
