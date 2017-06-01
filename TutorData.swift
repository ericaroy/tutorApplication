//
//  TutorData.swift
//  TheTutorApp
//
//  Created by Erica Roy on 5/24/17.
//  Copyright © 2017 Erica Roy. All rights reserved.
//

import Foundation
import GoogleSignIn
import Firebase


struct Tutor {
    
    var firstName: String
    var lastName: String
    var email: String
    var isTutor: Bool
    var profileImageURL: String
    var subjectCode: [String] // Accounting(ACCT), Marketing(MKTG)
    var programCode: String
    var dictKey: String
   
    
    init(key: String, dictionary: NSDictionary) {
        self.dictKey = key
        
        self.firstName = dictionary["firstName"] as! String!
        self.lastName = dictionary["lastName"] as! String!
        self.email = dictionary["email"] as! String!
        self.isTutor = dictionary["isTutor"] as! Bool!
        self.profileImageURL = dictionary["profileImage"] as! String!
        self.subjectCode = dictionary["subjects"] as! [String]!
        self.programCode = dictionary["program"] as! String!
        
        
    }
}
