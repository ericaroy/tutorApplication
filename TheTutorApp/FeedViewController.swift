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
import GoogleAPIClientForREST





class FeedViewController: UIViewController, GIDSignInUIDelegate, UITableViewDelegate, UITableViewDataSource{
   
    private let scopes = [kGTLRAuthScopeCalendarReadonly]
    private let service = GTLRCalendarService()
    
    var handle: AuthStateDidChangeListenerHandle?
    var user = Auth.auth().currentUser
    var ref: DatabaseReference!
    var tutors = [Tutor] ()
 
   
    
    @IBOutlet weak var tutorSearchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       getTutors()
       
        
    }
    
    func getTutors() {
        let ref = Database.database().reference()
        
        DispatchQueue.global().async {
            [unowned self] in
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
                        //print(x?["email"] as! String)
                        // print(type(of: stuff.subjectCode ))
                        self.tutors.insert(stuff, at: 0)
                        //print(self.tutors)
                        
                        
                    }
                }
                
                DispatchQueue.main.async {
                    [unowned self] in
                    self.tableView.reloadData()
                    
                    
                }
                
                
            }) { (error) in
                print(error)
            }
            
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
    
    
 
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TutorCell", for: indexPath) as! TutorTableViewCell
        
      
        let theTutor = tutors[indexPath.row]
        cell.tutorName?.text = theTutor.firstName + " " + theTutor.lastName
        cell.tutorProgram?.text = theTutor.programCode
        
        if (theTutor.subjectCode[0] == "Mathematics") {
            
        }
        switch theTutor.subjectCode[0] {
            case "Mathematics":
                cell.subjectImage?.image = UIImage(named: "Math-1")
            case "Music":
                cell.subjectImage?.image = UIImage(named: "Music")
            case "Biology":
                cell.subjectImage?.image = UIImage(named: "Biology")
            case "Art":
                cell.subjectImage?.image = UIImage(named: "Art")
            case "Business Admin":
                cell.subjectImage?.image = UIImage(named: "BusAdmin")
            case "Chemistry":
                cell.subjectImage?.image = UIImage(named: "Chemistry")
            case "Computer Scicence":
                cell.subjectImage?.image = UIImage(named: "CompSci")
            case "Criminal Justice":
                cell.subjectImage?.image = UIImage(named: "CrimJustice")
            case "Marketing":
                cell.subjectImage?.image = UIImage(named: "Marketing")
            case "Mass Comm":
                cell.subjectImage?.image = UIImage(named: "MassComm")
            case "Music":
                cell.subjectImage?.image = UIImage(named: "Music")
            case "Nursing":
                cell.subjectImage?.image = UIImage(named: "Nursing")
            case "Physics":
                cell.subjectImage?.image = UIImage(named: "Physics")
            case "Political Science":
                cell.subjectImage?.image = UIImage(named: "PoliticalScience")
            
        default:
            cell.subjectImage?.image = UIImage(named: "Math-1")
            
            
            
        }
        
        
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
   
    
    // MARK: - Navigation
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "ShowTutorProfile") {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let profilerView = segue.destination as! ProfileViewController
                profilerView.tutorNameProfile = tutors[indexPath.row].firstName + " " + tutors[indexPath.row].lastName
                profilerView.profileViewImageURL = tutors[indexPath.row].profileImageURL
                profilerView.profileSubject = tutors[indexPath.row].subjectCode
                
            }
        }
     
    }
    
  

}
