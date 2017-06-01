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
import MessageUI


class SignInViewController: UIViewController, UITextFieldDelegate, GIDSignInUIDelegate, MFMailComposeViewControllerDelegate{
    
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
    @IBAction func sendTutorApp(_ sender: Any) {
        if !(MFMailComposeViewController.canSendMail()) {
            print("Mail services not available")
            //TODO: Show Alert
            let emailAlert = UIAlertController.init(title: "Mail Setup", message: "Email is not setup", preferredStyle: .alert)
            let emailAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                print("You've pressed OK button");
                
            }
            emailAlert.addAction(emailAction)
            
            
            
        }else{
            let emailApp = MFMailComposeViewController()
            emailApp.mailComposeDelegate = self
            emailApp.setSubject("Tutor Assigntment Inquiry")
            emailApp.setToRecipients(["enicodev@gmail.com"])
            
            self.present(emailApp, animated: true, completion: nil)
            
            
        }
    
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch(result) {
        case MFMailComposeResult.sent:
            print("Email Sent")
        case MFMailComposeResult.cancelled:
            print("Email Cancelled")
        case MFMailComposeResult.failed:
            print("Email Failed")
        default:
            print("nothing")
            break
        }
        controller.dismiss(animated: true, completion: nil)
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
