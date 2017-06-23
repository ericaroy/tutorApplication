//
//  ProfileViewController.swift
//  TheTutorApp
//
//  Created by Erica Roy on 5/22/17.
//  Copyright © 2017 Erica Roy. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


class ProfileViewController: UIViewController {
    
  

    @IBOutlet weak var nameLabel: UILabel!
    var tutorNameProfile: String = ""
    
    @IBOutlet weak var imageViewProfile: UIImageView!
    var profileViewImageURL: String = ""
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var user = Auth.auth().currentUser?.uid
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = tutorNameProfile
        let url = URL(string: profileViewImageURL)
        if let data = NSData(contentsOf: url!) {
            imageViewProfile.image = UIImage(data: data as Data)
            imageViewProfile.layer.cornerRadius = 10.0
            imageViewProfile.clipsToBounds = true
            imageViewProfile.layer.borderWidth = 2.0
            imageViewProfile.layer.borderColor = UIColor.black.cgColor
        }
        
        
        

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
