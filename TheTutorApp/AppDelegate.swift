//
//  AppDelegate.swift
//  TheTutorApp
//
//  Created by Erica Roy on 4/21/17.
//  Copyright © 2017 Erica Roy. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

//TODO: Handle Revoked Tokens
//TODO: Handle Email Domains
//TODO: Handle Errors https://firebase.google.com/docs/auth/ios/errors

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate{
    
    var window: UIWindow?
    var ref: DatabaseReference!
    
    
    //MARK: Authentication - Google

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if error == nil || !(error != nil) {
            let authentication = user.authentication
            let creds = GoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!, accessToken: (authentication?.accessToken)!)
            
            //Setup variables for a user profile, grab from google profile
            let firstName = user.profile.givenName
            let lastName = user.profile.familyName
            let email = user.profile.email
            
            //TODO: Prevent Sign-In from incorrect Domain from Google
            print(user.hostedDomain)
            
            
            
            //Here let's grab the google profile image URL if there is one, if not we can add a default image later
            var profileImageURL = ""
            if user.profile.hasImage {
                profileImageURL = user.profile.imageURL(withDimension: 100).absoluteString
                print(profileImageURL)
            }else {
                profileImageURL = "no image"
            }
            
            
            
            
            //Now we are actually signing into our app/firebase
            Auth.auth().signIn(with: creds) { (user, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }

                self.ref = Database.database().reference()
                //Setup minimal profile, let user update later if valid
                self.ref.child("users").child(user!.uid).observeSingleEvent(of: .value, with: { (snapshot) in
                    let snapshot = snapshot.value as? NSDictionary
                    
                    
                    if (snapshot == nil){
                        self.ref.child("users").child((user!.uid)).setValue(["firstName": firstName!, "lastName": lastName!, "email": email!, "isTutor": true, "profileImage": profileImageURL,
                            "subjects": [""], "program": ""])
                        user?.sendEmailVerification(completion: { (error) in
                            
                        })
                      
                        
                        
                    }
                    else{
                        
                        self.window?.rootViewController?.performSegue(withIdentifier: "FeedSegue", sender: nil)
                       
                        
                    }
                })
                
                
            }
            
     
           
        }else {
            print(error.localizedDescription)
        }
        

        
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
    
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any])
        -> Bool {
            return GIDSignIn.sharedInstance().handle(url,
                                                     sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                     annotation: [:])
    }


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
  
    




}

