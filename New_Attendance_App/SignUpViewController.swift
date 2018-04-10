//
//  SignUpViewController.swift
//  New_Attendance_App
//
//  Created by Nicholas Furbee on 4/10/18.
//  Copyright © 2018 Robert Miller. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func submitButton(_ sender:Any){
        guard let username = usernameField.text else { return }
        guard let email = emailField.text else { return }
        guard let pass = passwordField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                print("User created!")
                
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = username
                
                changeRequest?.commitChanges { error in
                    if error == nil {
                        print("User display name changed!")
                        self.dismiss(animated: false, completion: nil)
                    } else {
                        print("Error: \(error!.localizedDescription)")
                    }
                }
                
            } else {
                print("Error: \(error!.localizedDescription)")
            }
        }
        
        self.performSegue(withIdentifier: "toHomeScreen", sender: self)
        
    }
    
        
        
    
}
