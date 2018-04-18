//
//  SignUpViewController.swift
//  New_Attendance_App
//
//  Created by Robert Miller on 4/10/18.
//  Copyright © 2018 Robert Miller. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class SignUpViewController: UIViewController {
    
    var refUsers: DatabaseReference!
    
    
    
    
    
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refUsers = Database.database().reference().child("users");

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addUser(){
        let key = refUsers.childByAutoId().key
        
        let users = ["id":key,
                     "username":usernameField.text! as String,
                     "email":emailField.text! as String,
                     "password":passwordField.text! as String
                    ]
    }
    
    @IBAction func submitButton(_ sender:Any){
        guard let username = usernameField.text else { return }
        guard let email = emailField.text else { return }
        guard let pass = passwordField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                self.addUser()
                print("User created!")
                
                //Auth.auth().currentUser.
                
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
        self.performSegue(withIdentifier: "toHomeScreen", sender:self)
    }
    
    @IBAction func backButton(_ sender:Any){
        self.performSegue(withIdentifier: "backToHome", sender:self)
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
