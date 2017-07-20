//
//  MainViewController.swift
//  TheTutorApp
//
//  Created by Erica Roy on 6/19/17.
//  Copyright © 2017 Erica Roy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var searchFieldTextInput: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    var subjects = [String] ()
    
    //TODO: Pull From Source for Updates/Remove Hard Coding Dispatchv
    var predictText = ["Accounting",
    "Adult Education",
    "Advertising",
    "Anthropology",
    "Applied Communication",
    "Applied Design",
    "Applied Music",
    "Applied Science",
    "Arabic",
    "Art Education",
    "Art History and Appreciation",
    "Arts, Letters & Sciences",
    "Astronomy",
    "Audiology/Speech Pathology",
    "Bioinformatics",
    "Biology",
    "Business Administration",
    "Business Information Systems",
    "Chemistry",
    "Chinese",
    "Clinton Sch of Public Service",
    "Computer Science",
    "Construction Management",
    "Counseling",
    "Counselor Education",
    "Criminal Justice",
    "Dance",
    "Early Childhood Education",
    "Earth Science",
    "Information Science",
    "Information Technology",
    "Integrated Grad Science",
    "Interdisciplinary Studies",
    "International Business",
    "International Studies",
    "Interpreting For The Deaf",
    "Law",
    "Learning Systems Technology",
    "Management",
    "Marketing",
    "Mass Comm",
    "Mathematics",
    "Mechanical Engr Technology",
    "Middle Childhood Education",
    "Military Science",
    "Music Education",
    "Music Ensemble",
    "Music History and Literature",
    "Music Theory",
    "Nonprofit Leadership Studies",
    "Nursing",
    "Personal Awareness",
    "Philosophy",
    "Physics",
    "Political Science",
    "Poverty Studies",
    "Private Music",
    "Psychology"]
    
    override func viewDidLoad() {
        //TODO: Add Animation transition with Text
        //TODO: Add Intro Swipe
        super.viewDidLoad()
       
        tableView.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        tableView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
     
        tableView.isHidden = false
        let substring = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        searchTextEntry(substring: substring)
        return true
        
    }
    

    func searchTextEntry(substring: String) {
        subjects.removeAll(keepingCapacity: false)
        
        
        for x in predictText {
            
            let theString = x as NSString
            let subStringRange = theString.range(of: substring)
            if (subStringRange.location == 0) {
                subjects.append(x)
            }
        }
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subjects.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PredictCell", for: indexPath) as! PredictTableViewCell
        
        let index = indexPath.row as Int
        cell.predictLabel?.text = subjects[index]


        return cell
    }
    
    //TODO: Return Resources From Selection by Department
    /*
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = subjects[indexPath.row]  
}
*/
}
