//
//  ProfileViewController.swift
//  TheTutorApp
//
//  Created by Erica Roy on 5/22/17.
//  Copyright © 2017 Erica Roy. All rights reserved.
//

import UIKit
import Firebase


class ProfileViewController: UIViewController {
    

    @IBOutlet weak var nameLabel: UILabel!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let databaseRef = appDelegate.ref
        
        var user = Auth.auth().currentUser?.uid
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
