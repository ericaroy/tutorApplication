//
//  FeedViewController.swift
//  TheTutorApp
//
//  Created by Erica Roy on 5/17/17.
//  Copyright © 2017 Erica Roy. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn




class FeedViewController: UIViewController, GIDSignInUIDelegate, UITableViewDelegate, UITableViewDataSource {
   
    var handle: AuthStateDidChangeListenerHandle?
    var user = Auth.auth().currentUser
    var ref: DatabaseReference!
    var tutors = [Tutor] ()
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       
        let ref = Database.database().reference()
     
        ref.child("users").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            self.tutors = []
            
            if let result = snapshot.children.allObjects as? [DataSnapshot] {
                for child in result {
                    let xDict = child.value as? NSDictionary
                   // print(child.key)
                    let key = child.key
                    
                   // print(xDict)
                   let stuff = Tutor(key: key, dictionary: xDict!)
                   // print(x?["email"] as! String)
                   // print(stuff)
                    self.tutors.insert(stuff, at: 0)
                   // print(self.tutors)
            
                    
                   
                }
            }
            self.tableView.reloadData()
            
        }) { (error) in
            print(error)
        }
      
    
     
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
        })
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tutors.count
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

 
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TutorCell", for: indexPath) as! TutorTableViewCell
        
      
        let theTutor = tutors[indexPath.row]
        cell.tutorName?.text = theTutor.firstName + " " + theTutor.lastName
        cell.tutorProgram?.text = theTutor.programCode
        
        let url = URL(string: theTutor.profileImageURL)
        if let data = NSData(contentsOf: url!) {
            cell.tutorImage?.image = UIImage(data: data as Data)
        }//else put a stub image
        
        cell.tutorImage.layer.cornerRadius = 10.0
        cell.tutorImage.clipsToBounds = true
        cell.tutorImage.layer.borderWidth = 2.0
        cell.tutorImage.layer.borderColor = UIColor.black.cgColor
     
        return cell
     }

    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
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
    */

}
