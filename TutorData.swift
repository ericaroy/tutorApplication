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
    
    let firstName: String
    let lastName: String
    let email: String
    var isTutor: Bool
    var profileImageURL: String
    var subjectCode: [String: String] // Accounting(ACCT), Marketing(MKTG)
    var programCode: [String]
    //let ref: DatabaseReference!
    
    init(firstName: String, lastName: String, email: String, isTutor: Bool, profileImageURL: String, subjectCode: [String: String], programCode: [String]) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.isTutor = isTutor
        self.profileImageURL = profileImageURL
        self.subjectCode = subjectCode
        self.programCode = programCode
        
        
    }
}
